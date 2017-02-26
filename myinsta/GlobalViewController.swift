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
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
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
    self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white,
                                                                    NSFontAttributeName: UIFont(name: MIChart.Fonts.kPacificoRegular, size: 20)!]
    
    let accountButton = UIBarButtonItem(image: UIImage(named: MIChart.Assets.kUser), style: .plain, target: self, action: #selector(accountItemTapped))
    let backButton = UIBarButtonItem(image: UIImage(named: MIChart.Assets.kBack), style: .plain, target: self, action: #selector(backItemTapped))
    
    //Right buttons
    self.navigationItem.rightBarButtonItems = [accountButton]
    
    // if there is more than 1 viewcontroller, then add a back button
    if (self.navigationController?.viewControllers.count)! > 1 {
      self.navigationItem.leftBarButtonItems = [backButton]
    }
  }
  
  //MARK: - Public
  func updateToolbarTitle(_ title:String) {
    self.navigationItem.title = title
  }
  
  func hideRightBarButtons() {
    self.navigationItem.rightBarButtonItems = []
  }
  
  //MAKR: - Actions
  @objc private func accountItemTapped() {
    if let nc = self.navigationController, let profileViewController = ProfileRouter().getInitViewController() {
      nc.pushViewController(profileViewController, animated: true)
    }
  }
  
  @objc private func backItemTapped() {
    if let navController = self.navigationController, navController.viewControllers.count > 1 {
      navController.popViewController(animated: true)
    }
  }
}
