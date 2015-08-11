//
//  CatMediaPickerControllerAppearance.m
//  CatMediaPickerController
//
//  Created by K-cat on 15/8/11.
//  Copyright (c) 2015年 K-cat. All rights reserved.
//

#import "CatMediaPickerControllerAppearance.h"

@implementation CatMediaPickerControllerAppearance

+ (instancetype)appearance {
  CatMediaPickerControllerAppearance *appearance =
      [[CatMediaPickerControllerAppearance alloc] init];
  [appearance setControllerTitlePhotoAlbum:@"Photo Album"];
  [appearance setButtonTitlePreview:@"Preview"];
  [appearance setButtonTitleSend:@"Send"];
  [appearance setButtonTitleCancel:@"Cancel"];
  return appearance;
}

@end
