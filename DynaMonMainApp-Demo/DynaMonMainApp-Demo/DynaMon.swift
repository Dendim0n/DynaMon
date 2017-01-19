//
//  DynaMon.swift
//  DynamicModuleServiceDemo
//
//  Created by 任岐鸣 on 2017/1/19.
//  Copyright © 2017年 Ned. All rights reserved.
//

import UIKit

class DynaMon: NSObject {
    
    static let shared = DynaMon()
    private let lock = NSLock()
    
    override init() {
        super.init()
        NotificationCenter.default.addObserver(self, selector: #selector(registerClass), name: NSNotification.Name.init(rawValue: "RegisterClass"), object: nil)
        NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: "CanRegisterClass"), object: nil)
    }
    
    private var classDictionary = [String:AnyClass]()
    
    func registerServices(name:String,classToReg:AnyClass) {
        lock.lock()
        classDictionary[name] = classToReg
        lock.unlock()
    }
    
    func registerClass(_ sender:Notification) {
        guard sender.userInfo != nil else {
            print("Class Register Failed. -- No UserInfo")
            return
        }
        if sender.userInfo!["name"] != nil && sender.userInfo!["class"] != nil  {
            registerServices(name: sender.userInfo!["name"] as! String, classToReg: NSClassFromString(sender.userInfo!["class"] as! String)!)
            print("Class Register Successfully.")
        } else {
            print("Class Register Failed. -- Wrong UserInfo")
        }
    }
    
    func getObject(name:String) -> Any {
        if let someClass = classDictionary[name] {
            return someClass.alloc()
        } else {
            return UIViewController()
        }
    }
    
}
