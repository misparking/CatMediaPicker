//
//  CatMediaPickerController.h
//  CatImagePickerController
//
//  Created by K-cat on 15/8/8.
//  Copyright (c) 2015年 K-cat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CatMediaType.h"
#import "CatMediaSelectType.h"

@interface CatMediaPickerController : UINavigationController

/**
 *  A handler for select media complete action
 */
@property(nonatomic, copy) void (^completeSelectMediaHandler)
    (CatMediaPickerController *catMediaPickerController, NSArray *mediaArray);

/**
 *  A handler for select media failure action
 */
@property(nonatomic, copy) void (^cancelSelectMediaHandler)
    (CatMediaPickerController *catMediaPickerController);

#pragma mark - Instance Methods
/**
*  Instance a new CatMediaPickerController with appoint type
*
*  @param mediaType       Media type
*  @param mediaSelectType Media select type
*
*  @return New instance
*/
- (instancetype)initWithMediaType:(CatMediaType)mediaType
                  mediaSelectType:(CatMediaSelectType)mediaSelectType;

@end
