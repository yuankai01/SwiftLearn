//
//  ViewController.swift
//  SwiftStudy
//
//  Created by Gao on 2019/8/21.
//  Copyright © 2019 Gao. All rights reserved.
//

import UIKit

enum AlignTypedaa : Int {
    case top = 10,left,right,bottom
    case aa
    //    case Left,
    //    case Right,
    //    case Bottom
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("ViewController  viewDidLoad ==")
        let align = AlignTypedaa.bottom.rawValue
        
        print("align == \(String(describing: align))")
        
        let alignBtn = SwiftAlignButton.init(frame: CGRect.init(x: 20, y: 100, width: 100, height: 100))
        alignBtn.backgroundColor = .red
        self.view.addSubview(alignBtn)
    }
    
}

