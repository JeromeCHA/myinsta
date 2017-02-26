//
//  LoginRouter.swift
//  myinsta
//
//  Created by Jérôme Cha on 24/02/2017.
//  Copyright © 2017 Jérôme Cha. All rights reserved.
//

import UIKit

class LoginRouter: GlobalRouter {

  var loginViewController : LoginViewController?
  
  func getInitViewController() -> LoginViewController? {
    self.loginViewController = super.getUIViewControllerFromStoryboard(storyboardName: Constantes.Storyboards.kMain, viewControllerName: Constantes.ViewControllers.kLogin) as? LoginViewController
    self.initViper()
    return self.loginViewController
  }
  
  // init VIPER architecture
  fileprivate func initViper() {
    let presenter = LoginPresenter()
    let retreiveTokenInteractor = RetreiveTokenInteractor()
    
    presenter.router = self
    presenter.viewDelegate = self.loginViewController
    presenter.retreiveTokenInteractor = retreiveTokenInteractor
    
    loginViewController?.presenter = presenter
  }
  
  
  //MARK: - Redirect
  func goToProfile() {
    if let loginVC = self.loginViewController {
      super.presentViewControllerWithNavigationController(from: loginVC, to: HomeRouter().getInitNavigationController())
    }
  }
  
}
