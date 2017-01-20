//
//  DynaMon.swift
//  DynamicModuleServiceDemo
//
//  Created by 任岐鸣 on 2017/1/19.
//  Copyright © 2017年 Ned. All rights reserved.
//

import UIKit

struct DynaMonConstantString {
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

class DynaMon: NSObject {
    
    static let shared = DynaMon()
    private let lock = NSLock()
    private var classDictionary = [String:AnyClass]()
    private var instanceDictionary = [String:AnyClass]()
    
    override init() {
        super.init()
        setUpNotification()
    }
    
    func getObject(name:String) -> AnyObject {
        if let someClass = classDictionary[name] {
            return someClass.alloc()
        } else {
            fatalError(DynaMonConstantString.kFatalError_GetObject)
        }
    }
    
    func registerClass(_ sender:Notification) {
        guard sender.userInfo != nil else {
            fatalError(DynaMonConstantString.kClassFailedNoUserInfo)
        }
        if sender.userInfo!["name"] != nil && sender.userInfo!["class"] != nil  {
            registerClass(name: sender.userInfo!["name"] as! String, classToReg: NSClassFromString(sender.userInfo!["class"] as! String)!)
            print(DynaMonConstantString.kClassRegisterSuccessful)
        } else {
            fatalError(DynaMonConstantString.kClassFailedWrongUserInfo)
        }
    }
    
//    func registerInstance(_ sender:Notification) {
//        guard sender.userInfo != nil else {
//            fatalError(DynaMonConstantString.kInstanceFailedNoUserInfo)
//        }
//        if sender.userInfo!["name"] != nil && sender.userInfo!["instance"] != nil  {
//            registerInstance(name: sender.userInfo!["name"] as! String, instanceToReg: NSClassFromString(sender.userInfo!["class"] as! String)!)
//            print(DynaMonConstantString.kInstanceRegisterSuccessful)
//        } else {
//            fatalError(DynaMonConstantString.kInstanceFailedWrongUserInfo)
//        }
//    }
    
    func registerInstance(name: String,instanceClass: AnyClass) {
        registerInstance(name: name, instanceToReg: instanceClass)
    }
    
//    func getInstance(_ sender:Notification) {
//        guard sender.userInfo != nil else {
//            fatalError(DynaMonConstantString.kFatalError_GetInstance_NoUserInfo)
//        }
//        guard sender.userInfo?["name"] != nil else {
//            fatalError(DynaMonConstantString.kFatalError_GetInstance_NoUserInfo)
//        }
//        if let someClass = instanceDictionary[sender.userInfo!["name"] as! String] {
//            NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: DynaMonConstantString.kReturnInstance), object: NSStringFromClass(someClass))
//        } else {
//            fatalError(DynaMonConstantString.kFatalError_GetInstance)
//        }
//    }
    
    private func registerClass(name:String,classToReg:AnyClass) {
        lock.lock()
        classDictionary[name] = classToReg
        lock.unlock()
    }
    
    private func registerInstance(name:String,instanceToReg:AnyClass) {
        lock.lock()
        instanceDictionary[name] = instanceToReg
        lock.unlock()
    }
    
    private func setUpNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(registerClass(_:)), name: NSNotification.Name.init(rawValue: DynaMonConstantString.kRegisterClass), object: nil)
        
//        NotificationCenter.default.addObserver(self, selector: #selector(registerInstance(_:)), name: NSNotification.Name.init(rawValue: DynaMonConstantString.kRegisterInstance), object: nil)
        
//        NotificationCenter.default.addObserver(self, selector: #selector(getInstance(_:)), name: NSNotification.Name.init(rawValue: DynaMonConstantString.kGetInstance), object: nil)
        
        NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: DynaMonConstantString.kCanRegisterClass), object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.init(rawValue: DynaMonConstantString.kRegisterClass), object: nil)
    }
}
