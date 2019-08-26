//
//  SwiftBaseModel.swift
//  CETCNetPatient
//
//  Created by Gao on 2018/11/12.
//  Copyright © 2018 Aaron Yu. All rights reserved.
//

/* swift开发中model是应该选struck还是class
 Swift中类与结构体间的区别
 https://www.cnblogs.com/huyloveyou/p/6362126.html
 
 从上面的结果可以看出来，再次给对象赋值，结构体不会改变，而类则会改变原来的值，所以说明类的对象是引用类型，而结构体是值类型。
 
 还有的区别就是类是属于面向对象编程，结构体属于面向协议的编程，所谓面向协议编程其实就是面向对象的升级。在swift中推荐使用的是使用结构体，类在swift中不处于主流的地位，还有就是结构体也能够实现类的全部功能，结构体更模块化，默认实现初始化方法并且不用考虑ARC。
 
 Swift: 把 Struct 作为数据模型的注意事项
 https://blog.csdn.net/andy_jiangbin/article/details/77837723
 
 Choosing Between Structures and Classes
 https://developer.apple.com/documentation/swift/choosing_between_structures_and_classes
 
 */

import UIKit

class SwiftBaseModel: NSObject {
    
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
    
    override var description: String
    {
        return "self.description"
    }
}
