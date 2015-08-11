//
//  CatPhotoAlbumController.m
//  CatImagePickerController
//
//  Created by K-cat on 15/8/8.
//  Copyright (c) 2015年 K-cat. All rights reserved.
//

#import "CatPhotoAlbumController.h"
#import "CatPhotoAlbumTableViewCell.h"
#import "CatPhotoPickerController.h"

static NSString *const PhotoAlbumCellIdentifier = @"PhotoAlbumCellIdentifier";

@interface CatPhotoAlbumController () <UITableViewDataSource,
                                       UITableViewDelegate> {
  CatMediaSelectType _mediaSelectType;
  UITableView *_photoAlbumTable;
  NSMutableArray *_photoAlbumArray;
  ALAssetsLibrary *_alassetsLibrary;
  CatMediaPickerControllerAppearance *_appearance;
}

@end

@implementation CatPhotoAlbumController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (instancetype)initWithMediaSelectType:(CatMediaSelectType)mediaSelectType
                             appearance:(CatMediaPickerControllerAppearance *)
                                            appearance {
  self = [super init];
  if (self) {
    _mediaSelectType = mediaSelectType;
    _appearance = appearance;
    [self initBaseLayout];
    [self initBaseData];
  }
  return self;
}

#pragma mark - Initialize Methods
/**
 *  Init base layout
 */
- (void)initBaseLayout {
  [self setTitle:_appearance.controllerTitlePhotoAlbum];
  UIBarButtonItem *cancelBarButtonItem = [[UIBarButtonItem alloc]
      initWithTitle:_appearance.buttonTitleCancel
              style:UIBarButtonItemStyleDone
             target:self
             action:@selector(cancelBarButtonItemAction)];
  [self.navigationItem setLeftBarButtonItem:cancelBarButtonItem animated:YES];

  _photoAlbumTable =
      [[UITableView alloc] initWithFrame:self.view.bounds
                                   style:UITableViewStyleGrouped];
  [self.view addSubview:_photoAlbumTable];

  [_photoAlbumTable registerClass:[CatPhotoAlbumTableViewCell class]
           forCellReuseIdentifier:PhotoAlbumCellIdentifier];
  _photoAlbumTable.delegate = self;
  _photoAlbumTable.dataSource = self;
}

/**
 *  Init base data
 */
- (void)initBaseData {
  _photoAlbumArray = [[NSMutableArray alloc] init];
  _alassetsLibrary = [[ALAssetsLibrary alloc] init];
  [_alassetsLibrary enumerateGroupsWithTypes:ALAssetsGroupAll
      usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        if (group) {
          [_photoAlbumArray addObject:group];
        } else {
          [_photoAlbumTable reloadData];
        }
      }
      failureBlock:^(NSError *error){
      }];
}

#pragma mark - Actions
/**
 *  The action for cancel bar button item
 */
- (void)cancelBarButtonItemAction {
  [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UITableViewDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  CatPhotoAlbumTableViewCell *cell =
      [tableView dequeueReusableCellWithIdentifier:PhotoAlbumCellIdentifier
                                      forIndexPath:indexPath];
  ALAssetsGroup *tempGroup = [_photoAlbumArray objectAtIndex:indexPath.row];
  [cell.textLabel
      setText:[tempGroup valueForProperty:ALAssetsGroupPropertyName]];
  [cell.imageView setImage:[UIImage imageWithCGImage:[tempGroup posterImage]]];
  return cell;
}

- (void)tableView:(UITableView *)tableView
    didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  [tableView deselectRowAtIndexPath:indexPath animated:YES];
  ALAssetsGroup *tempGroup = [_photoAlbumArray objectAtIndex:indexPath.row];
  CatPhotoPickerController *photoPickerController =
      [[CatPhotoPickerController alloc] initWithAssetsGroup:tempGroup
                                            mediaSelectType:_mediaSelectType
                                                 appearance:_appearance];

  [photoPickerController
      setTitle:[tempGroup valueForProperty:ALAssetsGroupPropertyName]];
  [self.navigationController pushViewController:photoPickerController
                                       animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
  return _photoAlbumArray.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (CGFloat)tableView:(UITableView *)tableView
    heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  return 80;
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
