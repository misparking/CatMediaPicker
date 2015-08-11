//
//  CatPhotoPreviewController.h
//  CatImagePickerController
//
//  Created by K-cat on 15/8/10.
//  Copyright (c) 2015年 K-cat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CatMediaSelectType.h"
#import "CatMediaPickerControllerAppearance.h"

@interface CatPhotoPreviewController : UIViewController

/**
 *  Instance a new CatPhotoPreviewController with appoint arguments
 *
 *  @param assetsArray        Array contains ALAsset object
 *  @param defaultSelectIndex Default photo at index for preview
 *  @param appearance         Appearance for current CatPhotoPreviewController
 *
 *  @return New instance
 */
- (instancetype)initWithAssetsArray:(NSArray *)assetsArray
                 defaultSelectIndex:(NSInteger)defaultSelectIndex
                         appearance:
                             (CatMediaPickerControllerAppearance *)appearance;

@end
