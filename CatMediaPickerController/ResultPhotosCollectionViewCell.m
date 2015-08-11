//
//  ResultPhotosCollectionViewCell.m
//  CatMediaPickerController
//
//  Created by K-cat on 15/8/11.
//  Copyright (c) 2015年 K-cat. All rights reserved.
//

#import "ResultPhotosCollectionViewCell.h"

@implementation ResultPhotosCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    [self.contentView addSubview:_imageView];
  }
  return self;
}

@end
