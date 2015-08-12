# CatMediaPickerController

[![Build Status](https://api.travis-ci.org/K-cat/CatMediaPickerController.svg)](https://travis-ci.org/K-cat)
[![Version](https://img.shields.io/cocoapods/v/CatMediaPickerController.svg)](https://cocoapods.org/pods/CatMediaPickerController)
[![Platform](https://img.shields.io/cocoapods/p/CatMediaPickerController.svg)]()
[![License](https://img.shields.io/cocoapods/l/CatMediaPickerController.svg)]()

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
  [self presentViewController:mediaPickerController
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
[mediaPickerController
      setCancelSelectMediaHandler:^(CatMediaPickerController
                                        *tempMediaPickerController) {
        [tempMediaPickerController dismissViewControllerAnimated:YES
                                                      completion:nil];
        //Do something
      }];

```
