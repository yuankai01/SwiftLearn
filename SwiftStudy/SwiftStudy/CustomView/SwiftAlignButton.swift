//
//  SwiftAlignButton.swift
//  SwiftStudy
//
//  Created by Gao on 2019/8/29.
//  Copyright © 2019 Gao. All rights reserved.
//

import UIKit

enum AlignTypeaa : Int {
    case Top = 1,Left,Right,Bottom
    case aa
//    case Left,
//    case Right,
//    case Bottom
}

struct AlignType {
    var Top : Int
    var Left : Int
    var Right : Int
    var Bottom : Int
    
    // default designed init - 默认的指定初始化方法
//    init() {
//        Top = 2
//        Left = 100
//    }
    
}

struct Circle {
    var radius: Double
}


class SwiftAlignButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
//        let strucdd = AlignType()
        
//
//        print("top = \(strucdd.Top)")
        
        var circleA = Circle(radius: 5.0)
        let circleB = circleA
        circleA.radius = 10
        print(circleA)
        print(circleB)
        
        print("magenta ==\(magenta)")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    //函数体外 竟然可以定义变量？？？，但是并不能打印print
    let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
    let halfGray = Color(white: 0.5)
    let veryGreen = Color(red: 0.0, green: 1.0, blue: 0.0)
    let test = Color.init(white: 1)
    var aa = Color(white: 3)
    let df = Color(red: 13, green: 2, blue: 1)
    
    
}

struct Color {
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double) {
        self.red   = red
        self.green = green
        self.blue  = blue
    }
    init(white: Double) {
        red   = white
        green = white
        blue  = white
    }
}

