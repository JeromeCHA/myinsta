//
//  ProfileRouter.swift
//  myinsta
//
//  Created by Jérôme Cha on 25/02/2017.
//  Copyright © 2017 Jérôme Cha. All rights reserved.
//

import UIKit

class ProfileRouter: GlobalRouter {

  var profileViewController : ProfileViewController?
  
  func getInitViewController() -> ProfileViewController? {
    self.profileViewController = super.getUIViewControllerFromStoryboard(storyboardName: Constantes.Storyboards.kMain, viewControllerName: Constantes.ViewControllers.kProfile) as? ProfileViewController
    self.initViper()
    return self.profileViewController
  }
  
  fileprivate func initViper() {
    let presenter = ProfilePresenter()
    let getUserInfoInteractor = GetUserInfoInteractor()
    
    presenter.router = self
    presenter.viewDelegate = self.profileViewController
    presenter.getUserInfoInteractor = getUserInfoInteractor
    
    self.profileViewController?.presenter = presenter
  }
  
}
