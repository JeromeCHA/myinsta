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
    self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
    
    let accountButton = UIBarButtonItem(image: UIImage(named: MIChart.Assets.kUser), style: .plain, target: self, action: #selector(accountItemTapped))
    
    self.navigationItem.rightBarButtonItems = [accountButton]
  }
  
  //MARK: - Public
  func updateToolbarTitle(_ title:String) {
    self.navigationItem.title = title
  }
  
  func hideRightBarButtons() {
    self.navigationItem.rightBarButtonItems = []
  }
  
  //MAKR: - Redirect
  @objc private func accountItemTapped() {
    if let nc = self.navigationController, let profileViewController = ProfileRouter().getInitViewController() {
      nc.pushViewController(profileViewController, animated: true)
    }
  }
}
