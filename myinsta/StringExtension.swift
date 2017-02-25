//
//  StringExtension.swift
//  myinsta
//
//  Created by Jérôme Cha on 25/02/2017.
//  Copyright © 2017 Jérôme Cha. All rights reserved.
//

import UIKit

extension String {
  var trimmed : String {
    return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
  }
  
  var localized : String {
    return NSLocalizedString(self, comment: "")
  }
  
  // retrieve a trimmed string from regex
  func retrieveFrom(regex:String) -> String? {
    if let range = self.range(of:regex, options: .regularExpression) {
      return self.substring(with:range).trimmed
    } else {
      return nil
    }
  }
}
