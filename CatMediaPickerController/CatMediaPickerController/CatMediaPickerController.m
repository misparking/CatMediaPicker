//
//  CatMediaPickerController.m
//  CatImagePickerController
//
//  Created by K-cat on 15/8/8.
//  Copyright (c) 2015年 K-cat. All rights reserved.
//

#import "CatMediaPickerController.h"
#import "CatPhotoAlbumController.h"

@interface CatMediaPickerController () {
  CatMediaPickerControllerAppearance *_appearance;
}

@end

@implementation CatMediaPickerController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark - Instance Methods
- (instancetype)initWithMediaType:(CatMediaType)mediaType
                  mediaSelectType:(CatMediaSelectType)mediaSelectType
                       appearance:
                           (CatMediaPickerControllerAppearance *)appearance {
  if (appearance) {
    _appearance = appearance;
  } else {
    _appearance = [CatMediaPickerControllerAppearance appearance];
  }
  switch (mediaType) {
  case CatMediaTypePhoto: {
    CatPhotoAlbumController *imagePickerController =
        [[CatPhotoAlbumController alloc] initWithMediaSelectType:mediaSelectType
                                                      appearance:_appearance];
    self = [super initWithRootViewController:imagePickerController];
    if (self) {
    }
  } break;

  default:
    break;
  }
  return self;
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
