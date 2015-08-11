//
//  CatPhotoPreviewCollectionViewCell.h
//  CatImagePickerController
//
//  Created by K-cat on 15/8/11.
//  Copyright (c) 2015年 K-cat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CatPhotoPreviewCollectionViewCell
    : UICollectionViewCell <UIScrollViewDelegate>

@property(nonatomic, retain) UIImageView *previewImageView;

@end
