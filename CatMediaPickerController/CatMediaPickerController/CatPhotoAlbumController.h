//
//  CatPhotoAlbumController.h
//  CatImagePickerController
//
//  Created by K-cat on 15/8/8.
//  Copyright (c) 2015年 K-cat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "CatMediaSelectType.h"

@interface CatPhotoAlbumController : UIViewController

- (instancetype)initWithMediaSelectType:(CatMediaSelectType)mediaSelectType;

@end
