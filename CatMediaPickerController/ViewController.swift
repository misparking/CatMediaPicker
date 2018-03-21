//
//  ViewController.swift
//  CatMediaPickerController
//
//  Created by Kcat on 2018/3/10.
//  Copyright © 2018年 ImKcat. All rights reserved.
//

import UIKit
import Photos
import MobileCoreServices

class ViewController: UIViewController, CatPhotosPickerControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let photosPickerControllerConfigure = CatPhotosPickerControllerConfigure()
        photosPickerControllerConfigure.maximumSelectCount = 10
        let photosPickerController = CatPhotosPickerController(configure: photosPickerControllerConfigure)
        photosPickerController.pickerControllerDelegate = self
        self.present(photosPickerController, animated: true, completion: nil)
    }

    func didFinishPicking(pickerController: CatPhotosPickerController, media: [CatMedia]) {
        print(media)
        pickerController.dismiss(animated: true, completion: nil)
    }
    
    func didCancelPicking(pickerController: CatPhotosPickerController) {
        pickerController.dismiss(animated: true, completion: nil)
    }
    
}

