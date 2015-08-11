//
//  CatPhotoPreviewController.h
//  CatImagePickerController
//
//  Created by K-cat on 15/8/10.
//  Copyright (c) 2015年 K-cat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CatMediaSelectType.h"

@interface CatPhotoPreviewController : UIViewController

- (instancetype)initWithAssetsArray:(NSArray *)assetsArray
                    mediaSelectType:(CatMediaSelectType)mediaSelectType
                 defaultSelectIndex:(NSInteger)defaultSelectIndex;

@end
