//
//  CatPhotoPickerController.m
//  CatImagePickerController
//
//  Created by K-cat on 15/8/9.
//  Copyright (c) 2015年 K-cat. All rights reserved.
//

#import "CatPhotoPickerController.h"
#import "CatPhotoPickerCollectionViewCell.h"
#import "CatPhotoPreviewController.h"
#import "CatMediaPickerController.h"
#import "CatMedia.h"

static NSString *const PhotoPickerCellIdentifier = @"PhotoPickerCellIdentifier";

@interface CatPhotoPickerController () <UICollectionViewDelegateFlowLayout,
                                        UICollectionViewDelegate,
                                        UICollectionViewDataSource> {
  ALAssetsGroup *_photosSourceGroup;
  CatMediaSelectType _photosSelectType;
  UICollectionView *_photosCollectionView;
  NSMutableArray *_photosAssetsArray;
  UIBarButtonItem *_photosPreviewBarButton;
  NSMutableArray *_photosPickedArray;
  UIBarButtonItem *_photosSaveBarButton;
}

@end

@implementation CatPhotoPickerController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self initBaseLayout];
  [self initBaseData];
  // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (instancetype)initWithAssetsGroup:(ALAssetsGroup *)assetsGroup
                    mediaSelectType:(CatMediaSelectType)mediaSelectType {
  self = [super init];
  if (self) {
    _photosSourceGroup = assetsGroup;
    _photosSelectType = mediaSelectType;
  }
  return self;
}

/**
 *  Init base layout
 */
- (void)initBaseLayout {
  _photosSaveBarButton = [[UIBarButtonItem alloc]
      initWithBarButtonSystemItem:UIBarButtonSystemItemSave
                           target:self
                           action:@selector(saveBarButtonAction)];
  [self.navigationItem setRightBarButtonItem:_photosSaveBarButton animated:YES];

  _photosCollectionView = [[UICollectionView alloc]
             initWithFrame:self.view.bounds
      collectionViewLayout:[[UICollectionViewFlowLayout alloc] init]];
  [_photosCollectionView setBackgroundColor:[UIColor whiteColor]];
  [self.view addSubview:_photosCollectionView];

  [_photosCollectionView registerClass:[CatPhotoPickerCollectionViewCell class]
            forCellWithReuseIdentifier:PhotoPickerCellIdentifier];

  if (_photosSelectType == CatMediaSelectTypeMultiple) {
    [_photosCollectionView setAllowsMultipleSelection:YES];
  }

  _photosCollectionView.delegate = self;
  _photosCollectionView.dataSource = self;

  UIToolbar *functionToolbar = [[UIToolbar alloc]
      initWithFrame:CGRectMake(0, CGRectGetHeight(self.view.bounds) - 44,
                               CGRectGetWidth(self.view.bounds), 44)];
  [self.view addSubview:functionToolbar];

  _photosPreviewBarButton = [[UIBarButtonItem alloc]
      initWithTitle:NSLocalizedStringFromTable(
                        @"PhotosPreviewButton",
                        @"CatMediaPickerControllerLocalizable", nil)
              style:UIBarButtonItemStylePlain
             target:self
             action:@selector(photosPreviewBarButtonAction)];
  [_photosPreviewBarButton setEnabled:NO];
  [_photosPreviewBarButton setEnabled:NO];
  [functionToolbar setItems:@[ _photosPreviewBarButton ] animated:YES];
}

/**
 *  Init base data
 */
- (void)initBaseData {
  _photosPickedArray = [[NSMutableArray alloc] init];

  _photosAssetsArray = [[NSMutableArray alloc] init];
  [_photosSourceGroup setAssetsFilter:[ALAssetsFilter allPhotos]];
  [_photosSourceGroup
      enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index,
                                  BOOL *stop) {
        if (result) {
          [_photosAssetsArray addObject:result];
        } else {
          [_photosCollectionView reloadData];
        }
      }];
}

#pragma mark - Actions
/**
 *  Preview photos button action
 */
- (void)photosPreviewBarButtonAction {
  CatPhotoPreviewController *photoPreviewController =
      [[CatPhotoPreviewController alloc] initWithAssetsArray:_photosPickedArray
                                             mediaSelectType:_photosSelectType
                                          defaultSelectIndex:0];
  [self.navigationController pushViewController:photoPreviewController
                                       animated:YES];
}

/**
 *  Save select photos button action
 */
- (void)saveBarButtonAction {
  NSMutableArray *resultAssetsArray = [[NSMutableArray alloc] init];
  for (ALAsset *tempAsset in _photosPickedArray) {
    CatMedia *tempMedia = [CatMedia mediaWithAsset:tempAsset];
    [resultAssetsArray addObject:tempMedia];
  }
  ((CatMediaPickerController *)self.navigationController)
      .completeSelectMediaHandler(
          (CatMediaPickerController *)self.navigationController,
          resultAssetsArray);
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView
    didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
  switch (_photosSelectType) {
  case CatMediaSelectTypeSingle: {
    [_photosPickedArray removeAllObjects];
    [_photosPickedArray
        addObject:[_photosAssetsArray objectAtIndex:indexPath.row]];

  } break;
  case CatMediaSelectTypeMultiple: {
    [_photosPickedArray
        addObject:[_photosAssetsArray objectAtIndex:indexPath.row]];
  } break;
  default:
    break;
  }

  if (_photosPickedArray.count == 0) {
    [_photosPreviewBarButton setEnabled:NO];
    [_photosSaveBarButton setEnabled:NO];
  } else {
    [_photosPreviewBarButton setEnabled:YES];
    [_photosSaveBarButton setEnabled:YES];
  }
}

- (void)collectionView:(UICollectionView *)collectionView
    didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
  switch (_photosSelectType) {
  case CatMediaSelectTypeSingle: {

  } break;
  case CatMediaSelectTypeMultiple: {
    [_photosPickedArray
        removeObject:[_photosAssetsArray objectAtIndex:indexPath.row]];
  } break;
  default:
    break;
  }

  if (_photosPickedArray.count == 0) {
    [_photosPreviewBarButton setEnabled:NO];
    [_photosSaveBarButton setEnabled:NO];
  } else {
    [_photosPreviewBarButton setEnabled:YES];
    [_photosSaveBarButton setEnabled:YES];
  }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  CatPhotoPickerCollectionViewCell *cell = [collectionView
      dequeueReusableCellWithReuseIdentifier:PhotoPickerCellIdentifier
                                forIndexPath:indexPath];
  ALAsset *tempAsset = [_photosAssetsArray objectAtIndex:indexPath.row];
  [cell.imageView setImage:[UIImage imageWithCGImage:[tempAsset thumbnail]]];
  return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
  return _photosAssetsArray.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
  return CGSizeMake(CGRectGetWidth(self.view.bounds) / 4,
                    CGRectGetWidth(self.view.bounds) / 4);
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
