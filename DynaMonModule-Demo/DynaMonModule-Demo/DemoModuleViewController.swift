//
//  DemoModuleViewController.swift
//  DynamicModuleDemo
//
//  Created by 任岐鸣 on 2017/1/19.
//  Copyright © 2017年 Ned. All rights reserved.
//

import UIKit

struct ConstantString {
    static let kRegisterClass = "RegisterClass"
    static let kRegisterInstance = "RegisterInstance"
    static let kGetInstance = "GetInstance"
    static let kReturnInstance = "ReturnInstance"
    static let kCanRegisterClass = "CanRegisterClass"
    
    static let kClassFailedNoUserInfo = "Class Register Failed. -- No UserInfo"
    static let kClassFailedWrongUserInfo = "Class Register Failed. -- Wrong UserInfo"
    static let kClassRegisterSuccessful = "Class Register Successfully."
    
    static let kInstanceFailedNoUserInfo = "Instance Register Failed. -- No UserInfo"
    static let kInstanceFailedWrongUserInfo = "Instance Register Failed. -- Wrong UserInfo"
    static let kInstanceRegisterSuccessful = "Instance Register Successfully."
    
    static let kFatalError_GetObject = "Couldn't Find Type. Please Check if the class registered correctly."
    static let kFatalError_GetInstance = "Couldn't Find Type. Please Check if the Instance registered correctly."
    static let kFatalError_GetInstance_NoUserInfo = "Get Instance Failed. -- No UserInfo"
}

@objc(DemoModuleViewController)
open class DemoModuleViewController: UIViewController {
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        let btn = UIButton()
        btn.setTitle("This is the Module - Main ViewController", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.sizeToFit()
        btn.center = view.center
        btn.addTarget(self, action: #selector(presentFunc), for: .touchUpInside)
        view.addSubview(btn)
        
//        NotificationCenter.default.addObserver(self, selector: #selector(getClass(_:)), name: NSNotification.Name(rawValue: ConstantString.kGetInstance), object: nil)
    }
    
    func presentFunc() {
        let a = SubVC()
        a.view.backgroundColor = .white
        present(a, animated: true, completion: nil)
    }
//    
//    func getClass(_ sender:Notification) {
//        NSClassFromString(sender.object as! String) as DemoInstance
//    }
    

}
