//
//  UIViewExtension.swift
//  CatMediaPicker
//
//  Created by Kcat on 2018/3/16.
//  Copyright © 2018年 ImKcat. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    private struct AssociatedKeys {
        static var IdentifierString: String?
    }
    
    var identifierString: String? {
        
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.IdentifierString) as? String
        }
        
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.IdentifierString, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        
    }
    
}
