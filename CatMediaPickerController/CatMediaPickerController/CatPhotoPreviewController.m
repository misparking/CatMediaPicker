//
//  CatPhotoPreviewController.m
//  CatImagePickerController
//
//  Created by K-cat on 15/8/10.
//  Copyright (c) 2015年 K-cat. All rights reserved.
//

#import "CatPhotoPreviewController.h"
#import "CatMediaPickerController.h"
#import "CatMedia.h"
#import "CatPhotoPreviewCollectionViewCell.h"
#import <AssetsLibrary/AssetsLibrary.h>

static NSString *const PhotosPreviewCollectionViewCellIdentifier =
    @"PhotosPreviewCollectionViewCellIdentifier";

@interface CatPhotoPreviewController () <UICollectionViewDelegate,
                                         UICollectionViewDelegateFlowLayout,
                                         UICollectionViewDataSource> {
  CatMediaSelectType _photosSelectType;
  NSMutableArray *_photosAssetsArray;
  NSInteger _photosDefaultSelectIndex;
  UICollectionView *_photosPreviewCollectionView;
}

@end

@implementation CatPhotoPreviewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark - Instance Methods
- (instancetype)initWithAssetsArray:(NSArray *)assetsArray
                    mediaSelectType:(CatMediaSelectType)mediaSelectType
                 defaultSelectIndex:(NSInteger)defaultSelectIndex {
  self = [super init];
  if (self) {
    _photosSelectType = mediaSelectType;
    _photosAssetsArray = [[NSMutableArray alloc] initWithArray:assetsArray];
    _photosDefaultSelectIndex = defaultSelectIndex;

    [self initBaseLayout];
  }
  return self;
}

/**
 *  Init base layout
 */
- (void)initBaseLayout {
  UICollectionViewFlowLayout *tempLayout =
      [[UICollectionViewFlowLayout alloc] init];
  [tempLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
  _photosPreviewCollectionView =
      [[UICollectionView alloc] initWithFrame:self.view.bounds
                         collectionViewLayout:tempLayout];
  [_photosPreviewCollectionView setBackgroundColor:[UIColor blackColor]];
  [_photosPreviewCollectionView
                   registerClass:[CatPhotoPreviewCollectionViewCell class]
      forCellWithReuseIdentifier:PhotosPreviewCollectionViewCellIdentifier];
  [self.view addSubview:_photosPreviewCollectionView];

  UIBarButtonItem *saveBarButtonItem = [[UIBarButtonItem alloc]
      initWithBarButtonSystemItem:UIBarButtonSystemItemSave
                           target:self
                           action:@selector(saveBarButtonAction)];
  [self.navigationItem setRightBarButtonItem:saveBarButtonItem animated:YES];

  [_photosPreviewCollectionView setPagingEnabled:YES];

  _photosPreviewCollectionView.delegate = self;
  _photosPreviewCollectionView.dataSource = self;
}

#pragma mark - Actions
/**
 *  Save select photos button action
 */
- (void)saveBarButtonAction {
  NSMutableArray *resultAssetsArray = [[NSMutableArray alloc] init];
  for (ALAsset *tempAsset in _photosAssetsArray) {
    CatMedia *tempMedia = [CatMedia mediaWithAsset:tempAsset];
    [resultAssetsArray addObject:tempMedia];
  }
  ((CatMediaPickerController *)self.navigationController)
      .completeSelectMediaHandler(
          (CatMediaPickerController *)self.navigationController,
          resultAssetsArray);
}

#pragma mark - UICollectionViewDelegate
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  CatPhotoPreviewCollectionViewCell *cell =
      [collectionView dequeueReusableCellWithReuseIdentifier:
                          PhotosPreviewCollectionViewCellIdentifier
                                                forIndexPath:indexPath];
  ALAsset *tempAsset = [_photosAssetsArray objectAtIndex:indexPath.row];
  ALAssetRepresentation *tempAssetRepresentation =
      [tempAsset defaultRepresentation];
  [cell.previewImageView
      setImage:[UIImage imageWithCGImage:[tempAssetRepresentation
                                                 fullResolutionImage]]];
  return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
  return CGSizeMake(CGRectGetWidth(self.view.bounds),
                    CGRectGetHeight(self.view.bounds));
}

- (CGFloat)collectionView:(UICollectionView *)collectionView
                                      layout:(UICollectionViewLayout *)
                                                 collectionViewLayout
    minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
  return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView
                                 layout:(UICollectionViewLayout *)
                                            collectionViewLayout
    minimumLineSpacingForSectionAtIndex:(NSInteger)section {
  return 0;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
  return _photosAssetsArray.count;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little
preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
