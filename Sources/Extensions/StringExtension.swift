//
//  NSLocalizedStringExtension.swift
//  CatMediaPicker
//
//  Created by Kcat on 2018/3/16.
//  Copyright © 2018年 ImKcat. All rights reserved.
//

import Foundation

extension String {
    
    static func localizedString(defaultString: String, key: String, comment: String) -> String {
        let localizedString = NSLocalizedString(key, comment: comment)
        return localizedString == key ? defaultString : localizedString
    }
    
}
