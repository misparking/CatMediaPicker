//
//  CatMedia.m
//  CatImagePickerController
//
//  Created by K-cat on 15/8/10.
//  Copyright (c) 2015年 K-cat. All rights reserved.
//

#import "CatMedia.h"

@implementation CatMedia {
  ALAsset *_sourceAsset;
}

- (instancetype)initWithAsset:(ALAsset *)asset {
  self = [super init];
  if (self) {
    _sourceAsset = asset;
    if ([[_sourceAsset valueForProperty:ALAssetPropertyType]
            isEqualToString:ALAssetTypePhoto]) {
      _type = CatMediaTypePhoto;
    } else if ([[_sourceAsset valueForProperty:ALAssetPropertyType]
                   isEqualToString:ALAssetTypeVideo]) {
      _type = CatMediaTypeVideo;
    } else {
      _type = CatMediaTypeOther;
    }
  }
  return self;
}

+ (instancetype)mediaWithAsset:(ALAsset *)asset {
  CatMedia *catMedia = [[CatMedia alloc] initWithAsset:asset];
  return catMedia;
}

- (UIImage *)originalPhoto {
  ALAssetRepresentation *assetRepresentation =
      [_sourceAsset defaultRepresentation];
  return [UIImage imageWithCGImage:[assetRepresentation fullResolutionImage]];
}

@end
