//
//  GlobalViewController.swift
//  myinsta
//
//  Created by Jérôme Cha on 24/02/2017.
//  Copyright © 2017 Jérôme Cha. All rights reserved.
//

import UIKit

class GlobalViewController: UIViewController, UIGestureRecognizerDelegate {

  //MARK: - Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    if let _ = self.navigationController {
      self.makeNavigationBar()
    }
  }
  
  //MARK: - Private
  
  fileprivate func makeNavigationBar() {
    self.navigationController?.navigationBar.barTintColor = MIChart.Colors.kBlue
    self.navigationController?.navigationBar.tintColor = UIColor.white
    self.navigationController?.navigationBar.isTranslucent = true
    self.navigationController?.interactivePopGestureRecognizer?.delegate = self
  }
  
  //MARK: - Public
  open func updateToolbarTitle(_ title:String) {
    self.navigationItem.title = title
  }
}
