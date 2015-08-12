# CatMediaPickerController

# Introduction

A media picker controller for easy to use with my mind

# ScreenRecord

![ScreenShots1](https://raw.githubusercontent.com/K-cat/CatMediaPickerController/master/ScreenRecord.gif)

# Installation

CatMediaPickerController is available on [CocoaPods](http://cocoapods.org).Just add the following to your project Podfile:

```ruby
pod 'CatMediaPickerController'
```

# Usage

```objective-c
#import "CatMediaPickerController"

CatMediaPickerController *mediaPickerController =
      [[CatMediaPickerController alloc]
          initWithMediaType:CatMediaTypePhoto
            mediaSelectType:CatMediaSelectTypeSingle
                 appearance:[CatMediaPickerControllerAppearance appearance]];
  [self presentViewController:_mediaPickerController
                     animated:YES
                   completion:nil];

//Media select complete handler
[mediaPickerController
      setCompleteSelectMediaHandler:^(CatMediaPickerController
                                          *tempMediaPickerController,
                                      NSArray *mediaArray) {
        [tempMediaPickerController dismissViewControllerAnimated:YES
                                                      completion:nil];
        //Do something...
      }];

//Media select cancel handler
[_mediaPickerController
      setCancelSelectMediaHandler:^(CatMediaPickerController
                                        *tempMediaPickerController) {
        [tempMediaPickerController dismissViewControllerAnimated:YES
                                                      completion:nil];
        //Do something
      }];

```
