#DynaMon - The Elegant Way to make Modularized App

DynaMon is a very simple way to make App Modularization.
* Easy to use
* Less code

##Using:

###In Main Project:
1. Put `DynaMon.swift` in it.
2. Set `DynaMon.shared` at AppDelegate,

   like `var dynaMon = DynaMon.shared`

###In Framework:
1. Add `DynaMonRegister.h` and `DynaMonRegister.m` into the framework.
2. Modify the `className` and `class` at the `DynaMonRegister.m`

###How to use:

In main app:

         let a = ModuleService.sharedInstance.getObject(name: "demo") as! UIViewController
         a.view.backgroundColor = .white
         present(a, animated: true, completion: nil)

*For more details, please check the source code.*