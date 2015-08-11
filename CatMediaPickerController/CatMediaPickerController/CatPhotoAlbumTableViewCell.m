//
//  CatPhotoAlbumTableViewCell.m
//  CatImagePickerController
//
//  Created by K-cat on 15/8/8.
//  Copyright (c) 2015年 K-cat. All rights reserved.
//

#import "CatPhotoAlbumTableViewCell.h"

@implementation CatPhotoAlbumTableViewCell

- (void)awakeFromNib {
  // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier {
  self = [super initWithStyle:UITableViewCellStyleDefault
              reuseIdentifier:reuseIdentifier];
  if (self) {
    [self setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
  }
  return self;
}

- (void)layoutSubviews {
  [super layoutSubviews];
  [self.imageView
      setFrame:CGRectMake(0, 0, CGRectGetWidth(self.imageView.bounds),
                          CGRectGetHeight(self.imageView.bounds))];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
  [super setSelected:selected animated:animated];

  // Configure the view for the selected state
}

@end
