//
//  CatPhotoPreviewCollectionViewCell.m
//  CatImagePickerController
//
//  Created by K-cat on 15/8/11.
//  Copyright (c) 2015年 K-cat. All rights reserved.
//

#import "CatPhotoPreviewCollectionViewCell.h"

@implementation CatPhotoPreviewCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    _previewScrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    [self.contentView addSubview:_previewScrollView];
    _previewScrollView.delegate = self;
    [_previewScrollView setMinimumZoomScale:1];
    [_previewScrollView setMaximumZoomScale:2];

    _previewImageView = [[UIImageView alloc] initWithFrame:self.bounds];
    [_previewImageView setContentMode:UIViewContentModeScaleAspectFit];
    [_previewScrollView addSubview:_previewImageView];
  }
  return self;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
  CGFloat offsetX =
      (scrollView.contentSize.width < scrollView.bounds.size.width)
          ? (CGRectGetWidth(scrollView.bounds) - scrollView.contentSize.width) /
                2
          : 0;
  CGFloat offsetY =
      (scrollView.contentSize.height < scrollView.bounds.size.height)
          ? (CGRectGetHeight(scrollView.bounds) -
             scrollView.contentSize.height) /
                2
          : 0;
  [_previewImageView
      setCenter:CGPointMake(scrollView.contentSize.width / 2 + offsetX,
                            scrollView.contentSize.height / 2 + offsetY)];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
  return _previewImageView;
}

@end
