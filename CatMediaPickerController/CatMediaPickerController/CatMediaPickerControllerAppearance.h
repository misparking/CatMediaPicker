//
//  CatMediaPickerControllerAppearance.h
//  CatMediaPickerController
//
//  Created by K-cat on 15/8/11.
//  Copyright (c) 2015年 K-cat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CatMediaPickerControllerAppearance : NSObject

@property(nonatomic, copy) NSString *controllerTitlePhotoAlbum;
@property(nonatomic, copy) NSString *buttonTitlePreview;
@property(nonatomic, copy) NSString *buttonTitleSend;
@property(nonatomic, copy) NSString *buttonTitleCancel;

+ (instancetype)appearance;

@end
