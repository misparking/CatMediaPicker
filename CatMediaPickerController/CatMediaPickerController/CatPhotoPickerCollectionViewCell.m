//
//  CatPhotoPickerCollectionViewCell.m
//  CatImagePickerController
//
//  Created by K-cat on 15/8/9.
//  Copyright (c) 2015年 K-cat. All rights reserved.
//

#import "CatPhotoPickerCollectionViewCell.h"

@implementation CatPhotoPickerCollectionViewCell {
  UIView *_maskView;
  UIImageView *_correctView;
}

- (instancetype)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    [self.contentView addSubview:_imageView];

    _maskView = [[UIView alloc] initWithFrame:self.bounds];
    [_maskView setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.2]];
    [self.contentView addSubview:_maskView];
    [_maskView setAlpha:0];

    _correctView = [[UIImageView alloc] initWithFrame:self.bounds];
    [_correctView setImage:[UIImage imageNamed:@"Correct"]];
    [self.contentView addSubview:_correctView];
    [_correctView setAlpha:0];
  }
  return self;
}

- (void)setSelected:(BOOL)selected {
  [super setSelected:selected];
  if (selected) {
    [_correctView setBounds:CGRectMake(0, 0, 0, 0)];
    [UIView animateWithDuration:0.3f
                     animations:^{
                       [_maskView setAlpha:1];
                       [_correctView setBounds:self.bounds];
                       [_correctView setAlpha:1];
                     }];
  } else {
    [UIView animateWithDuration:0.3f
                     animations:^{
                       [_maskView setAlpha:0];
                       [_correctView setAlpha:0];
                       [_correctView setBounds:CGRectMake(0, 0, 0, 0)];
                     }];
  }
}

@end
