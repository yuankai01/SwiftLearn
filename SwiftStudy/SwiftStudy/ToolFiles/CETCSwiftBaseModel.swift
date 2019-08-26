//
//  CETCSwiftBaseModel.swift
//  CETCNetPatient
//
//  Created by Gao on 2018/11/12.
//  Copyright © 2018 Aaron Yu. All rights reserved.
//

import UIKit

class CETCSwiftBaseModel: NSObject {
    
    init(dic:[String : Any]?) {
        super.init()
        
        if dic != nil {
            self.setValuesForKeys(dic!)
        }
    }
    
    override func setValue(_ value: Any?, forKey key: String) {
        super.setValue(value, forKey: key)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
