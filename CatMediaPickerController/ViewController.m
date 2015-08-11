//
//  ViewController.m
//  CatMediaPickerController
//
//  Created by K-cat on 15/8/11.
//  Copyright (c) 2015年 K-cat. All rights reserved.
//

#import "ViewController.h"
#import "CatMediaPickerController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
  CatMediaPickerController *mediaPickerController =
      [[CatMediaPickerController alloc]
          initWithMediaType:CatMediaTypePhoto
            mediaSelectType:CatMediaSelectTypeMultiple];
  [self presentViewController:mediaPickerController
                     animated:YES
                   completion:nil];
  [mediaPickerController
      setCompleteSelectMediaHandler:^(CatMediaPickerController
                                          *mediaPickerController,
                                      NSArray *mediaArray) {
        NSLog(@"%@", mediaArray);
      }];
}

@end
