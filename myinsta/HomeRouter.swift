//
//  HomeRouter.swift
//  myinsta
//
//  Created by Jérôme Cha on 25/02/2017.
//  Copyright © 2017 Jérôme Cha. All rights reserved.
//

import UIKit

class HomeRouter: GlobalRouter {

  var homeViewController : HomeViewController?
  
  func getInitViewController() -> HomeViewController? {
    self.homeViewController = super.getUIViewControllerFromStoryboard(storyboardName: Constantes.Storyboards.kMain, viewControllerName: Constantes.ViewControllers.kHome) as? HomeViewController
    self.initViper()
    return self.homeViewController
  }
  
  fileprivate func initViper() {
    let presenter = HomePresenter()
    
    presenter.router = self
    presenter.viewDelegate = self.homeViewController
    
    self.homeViewController?.presenter = presenter
  }
  
}
