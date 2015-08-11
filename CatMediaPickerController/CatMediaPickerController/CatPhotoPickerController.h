//
//  CatPhotoPickerController.h
//  CatImagePickerController
//
//  Created by K-cat on 15/8/9.
//  Copyright (c) 2015年 K-cat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "CatMediaSelectType.h"
#import "CatMediaPickerControllerAppearance.h"

@interface CatPhotoPickerController : UIViewController

/**
*  Instance a CatPhotoPickerController with appoint ALAssetsGroup and select
*way
*
*  @param assetsGroup     Appoint ALAssetsGroup
*  @param mediaSelectType Appoint select way
*  @param appearance      Appearance for current CatPhotoPickerController
*
*  @return New instance
*/
- (instancetype)initWithAssetsGroup:(ALAssetsGroup *)assetsGroup
                    mediaSelectType:(CatMediaSelectType)mediaSelectType
                         appearance:
                             (CatMediaPickerControllerAppearance *)appearance;

@end
