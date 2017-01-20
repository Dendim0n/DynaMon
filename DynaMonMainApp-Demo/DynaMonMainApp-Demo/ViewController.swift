//
//  ViewController.swift
//  DynamicModuleServiceDemo
//
//  Created by 任岐鸣 on 2017/1/19.
//  Copyright © 2017年 Ned. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let btn = UIButton()
        btn.setTitle("This is the MAIN ViewController", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.sizeToFit()
        btn.center = view.center
        btn.addTarget(self, action: #selector(presentFunc), for: .touchUpInside)
        view.addSubview(btn)
    }
    
    func presentFunc() {
        let a = DynaMon.shared.getObject(name: "demo") as! UIViewController
        a.view.backgroundColor = .white
        present(a, animated: true, completion: nil)
    }
    
    func findClass(testClass:AnyClass) {
        (testClass as! DemoInstance.Type).shared
    }
    
}

