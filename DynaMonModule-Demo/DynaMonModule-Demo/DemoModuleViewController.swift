//
//  DemoModuleViewController.swift
//  DynamicModuleDemo
//
//  Created by 任岐鸣 on 2017/1/19.
//  Copyright © 2017年 Ned. All rights reserved.
//

import UIKit

@objc(DemoModuleViewController)
public class DemoModuleViewController: UIViewController {
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        let btn = UIButton()
        btn.setTitle("This is the Module - Main ViewController", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.sizeToFit()
        btn.center = view.center
        btn.addTarget(self, action: #selector(presentFunc), for: .touchUpInside)
        view.addSubview(btn)
    }
    
    func presentFunc() {
        let a = SubVC()
        a.view.backgroundColor = .white
        present(a, animated: true, completion: nil)
    }

}
