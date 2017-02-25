//
//  UserDefaultsManager.swift
//  myinsta
//
//  Created by Jérôme Cha on 25/02/2017.
//  Copyright © 2017 Jérôme Cha. All rights reserved.
//

import UIKit

class UserDefaultsManager: NSObject {
  fileprivate static let defaults = UserDefaults.standard
  
  static func saveString(key:String, andValue value:String) {
    defaults.set(value, forKey: key)
  }
  
  static func getString(key:String) -> String? {
    return defaults.string(forKey: key)
  }
  
  static func saveBool(key:String, andBool bool:Bool) {
    defaults.set(bool, forKey: key)
  }
  
  static func getBool(key:String) -> Bool {
    return defaults.bool(forKey: key)
  }
  
  static func saveInt(key:String, andInt int:Int) {
    defaults.set(int, forKey: key)
  }
  
  static func getInt(key:String) -> Int {
    return defaults.integer(forKey: key)
  }
  
  static func removeObject(key:String) {
    defaults.removeObject(forKey: key)
  }
  
  static func removeAllObject() {
    if let bundle = Bundle.main.bundleIdentifier {
      defaults.removePersistentDomain(forName: bundle)
    }
  }
}
