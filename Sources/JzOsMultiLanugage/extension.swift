//
//  extension.swift
//  JzOsMultiLanugage
//
//  Created by Jianzhi.wang on 2020/4/7.
//  Copyright © 2020 Jianzhi.wang. All rights reserved.
//

import Foundation
import UIKit
public extension String{
    func getFix()->String{
        let db=JzLanguage.getInstance().languageDB
        if(JzLanguage.getInstance().testLan){
            return self
        }
        var b=self
        if(!b.contains("jz.")){return b}
        b = b.replace("jz.", "")
        var text=""
        db?.query("select `\(JzLanguage.getInstance().lan)` from language where id=\(b)", {
            a in
            text=a.getString(0)
        }, {})
        return (text.isEmpty) ? self:text
    }
    func replace(_ target: String, _ withString: String) -> String
      {
          return self.replacingOccurrences(of: target, with: withString, options: NSString.CompareOptions.literal, range: nil)
      }
}
public extension UIView{
    func fixLanguage(){
        for i in JzLanguage.getInstance().listallView(self.subviews){
            if(i is UIButton){
                let btn=i as! UIButton
                btn.setTitle(btn.titleLabel?.text?.getFix(), for: .normal)
            }else if(i is UITextField){
                let field=i as! UITextField
                field.placeholder=field.placeholder?.getFix()
            }else if(i is UILabel){
                let label=i as! UILabel
                label.text=label.text?.getFix()
            }
        }
    }
}
//@IBDesignable
//public extension UIButton{
//    @IBInspectable  var localtext:String{
//           get{
//            return self.titleLabel?.text ?? ""
//           }
//           set{
//            self.setTitle(newValue.localizableString(getPro("lan","en")), for: .normal)
//           }
//       }
//    func getPro(_ name: String,_ normal:String) -> String {
//                     let preferences = UserDefaults.standard
//                     let currentLevelKey = name
//                     if preferences.object(forKey: currentLevelKey) == nil {
//                         return normal
//                     } else {
//                         let currentLevel = preferences.string(forKey: currentLevelKey)!
//                         return currentLevel
//                     }
//                 }
//}
//@IBDesignable
//public extension UITextField{
//    func getPro(_ name: String,_ normal:String) -> String {
//        let preferences = UserDefaults.standard
//        let currentLevelKey = name
//        if preferences.object(forKey: currentLevelKey) == nil {
//            return normal
//        } else {
//            let currentLevel = preferences.string(forKey: currentLevelKey)!
//            return currentLevel
//        }
//    }
//    @IBInspectable var localhint:String{
//             get{
//                return self.placeholder ?? ""
//
//        }
//             set{
//self.placeholder=newValue.localizableString(getPro("lan","en"))
//             }
//         }
//}
//@IBDesignable
//public extension UILabel{
//    @IBInspectable var localtext:String{
//        get{
//            return self.text ?? ""
//        }
//        set{
//            self.text = newValue.localizableString(getPro("lan","en"))
//        }
//    }
//
//    func getPro(_ name: String,_ normal:String) -> String {
//           let preferences = UserDefaults.standard
//           let currentLevelKey = name
//           if preferences.object(forKey: currentLevelKey) == nil {
//               return normal
//           } else {
//               let currentLevel = preferences.string(forKey: currentLevelKey)!
//               return currentLevel
//           }
//       }
//}
//public extension String{
//    func localizableString()->String{
//        let path=Bundle.main.path(forResource: getPro("lan","en"), ofType: "lproj")
//        print(path)
//        if(path==nil){
//            return self
//        }else{
//            return NSLocalizedString(self, tableName: nil, bundle: Bundle(path: path!)!, value: "", comment: "")
//        }
//    }
//    func localizableString(_ loc:String)->String{
//        let path=Bundle.main.path(forResource: loc, ofType: "lproj")
//        print(path)
//        if(path==nil){
//            return self
//        }else{
//            return NSLocalizedString(self, tableName: nil, bundle: Bundle(path: path!)!, value: "", comment: "")
//        }
//    }
//    func getPro(_ name: String,_ normal:String) -> String {
//              let preferences = UserDefaults.standard
//              let currentLevelKey = name
//              if preferences.object(forKey: currentLevelKey) == nil {
//                  return normal
//              } else {
//                  let currentLevel = preferences.string(forKey: currentLevelKey)!
//                  return currentLevel
//              }
//          }
//}
//}
