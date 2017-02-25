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
}
