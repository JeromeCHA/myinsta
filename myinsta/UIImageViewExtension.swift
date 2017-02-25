//
//  UIImageViewExtension.swift
//  myinsta
//
//  Created by Jérôme Cha on 26/02/2017.
//  Copyright © 2017 Jérôme Cha. All rights reserved.
//

import UIKit

extension UIImageView {
  func rounded() {
    self.layoutIfNeeded()
    self.layer.cornerRadius = self.frame.size.width / 2
    self.clipsToBounds = true
    self.layer.borderWidth = 1
    self.layer.masksToBounds = true
    self.layer.borderColor = UIColor.groupTableViewBackground.cgColor
  }
}
