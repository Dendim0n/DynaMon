//
//  SubVC.swift
//  DynamicModuleDemo
//
//  Created by 任岐鸣 on 2017/1/19.
//  Copyright © 2017年 Ned. All rights reserved.
//

import UIKit

class SubVC: UIViewController {

     override func viewDidLoad() {
        super.viewDidLoad()
        let label = UILabel()
        label.text = "This is the Module - Second ViewController"
        label.sizeToFit()
        label.center = view.center
        view.addSubview(label)
    }
    



}
