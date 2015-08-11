//
//  CatMedia.h
//  CatImagePickerController
//
//  Created by K-cat on 15/8/10.
//  Copyright (c) 2015年 K-cat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <UIKit/UIKit.h>
#import "CatMediaType.h"

@interface CatMedia : NSObject

/**
 *  Media type for current CatMedia object
 */
@property(nonatomic, readonly) CatMediaType type;

/**
 *  Source image for current CatMedia object
 */
@property(nonatomic, retain, readonly) UIImage *originalPhoto;

/**
 *  Instance new CatMedia with appoint ALAsset
 *
 *  @param asset Appoint ALAsset object
 *
 *  @return New instance
 */
+ (instancetype)mediaWithAsset:(ALAsset *)asset;

@end
