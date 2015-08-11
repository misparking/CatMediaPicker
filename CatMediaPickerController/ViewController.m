//
//  ViewController.m
//  CatMediaPickerController
//
//  Created by K-cat on 15/8/11.
//  Copyright (c) 2015年 K-cat. All rights reserved.
//

#import "ViewController.h"
#import "CatMediaPickerController.h"
#import "ResultPhotosCollectionViewCell.h"

static NSString *const ResultPhotosCollectionViewCellIdentifier =
    @"ResultPhotosCollectionViewCell";

@interface ViewController () <UICollectionViewDataSource,
                              UICollectionViewDelegate,
                              UICollectionViewDelegateFlowLayout> {
  CatMediaPickerController *_mediaPickerController;
  UICollectionView *_resultPhotosCollectionView;
  NSMutableArray *_resultPhotosArray;
}

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self initBaseLayout];
  [self initBaseData];
  // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark - Init Methods
/**
 *  Init base layout
 */
- (void)initBaseLayout {
  _resultPhotosCollectionView = [[UICollectionView alloc]
             initWithFrame:self.view.bounds
      collectionViewLayout:[[UICollectionViewFlowLayout alloc] init]];
  [_resultPhotosCollectionView setBackgroundColor:[UIColor whiteColor]];
  [self.view addSubview:_resultPhotosCollectionView];

  [_resultPhotosCollectionView
                   registerClass:[ResultPhotosCollectionViewCell class]
      forCellWithReuseIdentifier:ResultPhotosCollectionViewCellIdentifier];

  _resultPhotosCollectionView.delegate = self;
  _resultPhotosCollectionView.dataSource = self;

  UIBarButtonItem *singleBarButtonItem =
      [[UIBarButtonItem alloc] initWithTitle:@"Single select"
                                       style:UIBarButtonItemStyleDone
                                      target:self
                                      action:@selector(singleSelectAction)];
  [self.navigationItem setLeftBarButtonItem:singleBarButtonItem animated:YES];

  UIBarButtonItem *mutipleBarButtonItem =
      [[UIBarButtonItem alloc] initWithTitle:@"Mutiple select"
                                       style:UIBarButtonItemStyleDone
                                      target:self
                                      action:@selector(mutipleSelectAction)];
  [self.navigationItem setRightBarButtonItem:mutipleBarButtonItem animated:YES];
}

/**
 *  Init base data
 */
- (void)initBaseData {
  _resultPhotosArray = [[NSMutableArray alloc] init];
}

#pragma mark - Actions
/**
 *  Single select way
 */
- (void)singleSelectAction {
  _mediaPickerController = [[CatMediaPickerController alloc]
      initWithMediaType:CatMediaTypePhoto
        mediaSelectType:CatMediaSelectTypeSingle];
  [self presentViewController:_mediaPickerController
                     animated:YES
                   completion:nil];
  [_mediaPickerController
      setCompleteSelectMediaHandler:^(CatMediaPickerController
                                          *tempMediaPickerController,
                                      NSArray *mediaArray) {
        [tempMediaPickerController dismissViewControllerAnimated:YES
                                                      completion:nil];
        [_resultPhotosArray removeAllObjects];
        [_resultPhotosArray addObject:mediaArray];
        [_resultPhotosCollectionView reloadData];
      }];

  [_mediaPickerController
      setCancelSelectMediaHandler:^(CatMediaPickerController
                                        *tempMediaPickerController) {
        [tempMediaPickerController dismissViewControllerAnimated:YES
                                                      completion:nil];
      }];
}

/**
 *  Mutiple select way
 */
- (void)mutipleSelectAction {
  _mediaPickerController = [[CatMediaPickerController alloc]
      initWithMediaType:CatMediaTypePhoto
        mediaSelectType:CatMediaSelectTypeMultiple];
  [self presentViewController:_mediaPickerController
                     animated:YES
                   completion:nil];
  [_mediaPickerController
      setCompleteSelectMediaHandler:^(CatMediaPickerController
                                          *tempMediaPickerController,
                                      NSArray *mediaArray) {
        [tempMediaPickerController dismissViewControllerAnimated:YES
                                                      completion:nil];
        [_resultPhotosArray removeAllObjects];
        [_resultPhotosArray addObjectsFromArray:mediaArray];
        [_resultPhotosCollectionView reloadData];
      }];

  [_mediaPickerController
      setCancelSelectMediaHandler:^(CatMediaPickerController
                                        *tempMediaPickerController) {
        [tempMediaPickerController dismissViewControllerAnimated:YES
                                                      completion:nil];
      }];
}

#pragma mark - UICollectionViewDelegate

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  ResultPhotosCollectionViewCell *cell =
      [collectionView dequeueReusableCellWithReuseIdentifier:
                          ResultPhotosCollectionViewCellIdentifier
                                                forIndexPath:indexPath];
  CatMedia *tempMedia = [_resultPhotosArray objectAtIndex:indexPath.row];
  [cell.imageView setImage:tempMedia.originalPhoto];
  return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
  return _resultPhotosArray.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
  return CGSizeMake(CGRectGetWidth(self.view.bounds) / 2,
                    CGRectGetWidth(self.view.bounds) / 2);
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

@end
