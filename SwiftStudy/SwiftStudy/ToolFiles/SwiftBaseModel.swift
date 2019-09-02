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
    
    /* https://www.cnswift.org/initialization
     Swift 的子类不会默认继承父类的初始化器。Swift 的这种机制防止父类的简单初始化器被一个更专用的子类继承并被用来创建一个没有完全或错误初始化的新实例的情况发生。但可以重写。
     如果你想自定义子类来实现一个或多个和父类相同的初始化器，你可以在子类中为那些初始化器提供定制的实现。     当你写的子类初始化器匹配父类指定初始化器的时候，你实际上可以重写那个初始化器。因此，在子类的初始化器定义之前你必须写 override 修饰符。如同默认初始化器所描述的那样，即使是自动提供的默认初始化器你也可以重写。
     */
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
