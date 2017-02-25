//
//  UIViewControllerExtension.swift
//  myinsta
//
//  Created by Jérôme Cha on 25/02/2017.
//  Copyright © 2017 Jérôme Cha. All rights reserved.
//

import UIKit

extension UIViewController {
  
  func showAlert(title:String, message:String = "", cancelText:String = Constantes.Strings.kButtonClose.localized, cancelAction:(() -> Void)? = nil) {
    
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let cancelButton = UIAlertAction(title: cancelText, style: .cancel) { (action) in
      if let cancelEvent = cancelAction {
        cancelEvent()
      }
    }
    
    alertController.addAction(cancelButton)
    self.present(alertController, animated: true)
  }
}
