//
//  HomeRouter.swift
//  myinsta
//
//  Created by Jérôme Cha on 26/02/2017.
//  Copyright © 2017 Jérôme Cha. All rights reserved.
//

import UIKit

class HomeRouter: GlobalRouter {

  var homeViewController : HomeViewController?
  
  fileprivate func getInitViewController() -> HomeViewController? {
    self.homeViewController = super.getUIViewControllerFromStoryboard(storyboardName: Constantes.Storyboards.kMain, viewControllerName: Constantes.ViewControllers.kHome) as? HomeViewController
    self.initViper()
    return self.homeViewController
  }
  
  func getInitNavigationController() -> UINavigationController {
    let navigationController = self.getUIViewControllerFromStoryboard(storyboardName: Constantes.Storyboards.kMain, viewControllerName: Constantes.NavigationControllers.kHome) as! UINavigationController
    if let loginVC = self.getInitViewController() {
      navigationController.viewControllers = [loginVC]
    }
    return navigationController
  }
  
  fileprivate func initViper() {
    let presenter = HomePresenter()
    let getMediaRecentInteractor = GetMediaRecentInteractor()
    
    presenter.router = self
    presenter.viewDelegate = self.homeViewController
    presenter.getMediaRecentInteractor = getMediaRecentInteractor
    
    self.homeViewController?.presenter = presenter
  }
  
  //MARK: - Redirect
  func goToViewController(_ viewController:UIViewController) {
    if let homeVC = self.homeViewController {
      super.presentViewControllerWithNavigationController(from: homeVC, to: viewController)
    }
  }
  
  func goToDetailViewController(_ url:String) {
    if let homeVC = self.homeViewController, let detailVC = DetailRouter().getInitViewController(url: url) {
      super.presentViewControllerWithNavigationController(from: homeVC, to: detailVC)
    }
  }
}
