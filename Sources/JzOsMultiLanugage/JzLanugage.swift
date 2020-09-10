//
//  JzLanugage.swift
//  JzOsMultiLanugage
//
//  Created by Jianzhi.wang on 2020/4/7.
//  Copyright © 2020 Jianzhi.wang. All rights reserved.
//

import Foundation
import UIKit
import JzOsSqlHelper
public class JzLanguage{
    init() {
        languageDB=SqlHelper("language")
        languageDB!.initByBundleMain("localLan", ".db")
     
    }
    public static var instance:JzLanguage?=nil
    public static func getInstance()->JzLanguage{
        if(instance==nil){
            instance=JzLanguage()
        }
        return instance!
    }
    func listallView(_ inview:[UIView])->[UIView]{
        var views=[UIView]()
        for view in inview {
            views.append(view)
            if(view.subviews.count>0){
                views.append(contentsOf: listallView(view.subviews))
            }
        }
        return views
    }
    public  func getPro(_ name: String, _ normal: Bool) -> Bool {
        let preferences = UserDefaults.standard
        let currentLevelKey = name
        if preferences.object(forKey: currentLevelKey) == nil {
            return normal
        } else {
            let currentLevel = preferences.bool(forKey: currentLevelKey)
            return currentLevel
        }
    }
    public  func setPro(_ name: String, _ key: Bool) {
        let preferences = UserDefaults.standard
        preferences.set(key,forKey: name)
        let didSave = preferences.synchronize()
        if !didSave {
            print("saverror")
        }
    }
    public var languageDB:SqlHelper?=nil
    public var testLan=false
    public var lan="en"
}
