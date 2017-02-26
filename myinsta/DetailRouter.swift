//
//  DetailRouter.swift
//  myinsta
//
//  Created by Jérôme Cha on 27/02/2017.
//  Copyright © 2017 Jérôme Cha. All rights reserved.
//

import UIKit

class DetailRouter: GlobalRouter {

  var detailViewController : DetailViewController?
  
  func getInitViewController(url:String) -> DetailViewController? {
    self.detailViewController = super.getUIViewControllerFromStoryboard(storyboardName: Constantes.Storyboards.kMain, viewControllerName: Constantes.ViewControllers.kDetail) as? DetailViewController
    self.detailViewController?.url = url
    self.initViper()
    return self.detailViewController
  }
  
  fileprivate func initViper() {
    let presenter = DetailPresenter()
    
    presenter.router = self
    presenter.viewDelegate = self.detailViewController
    
    self.detailViewController?.presenter = presenter
  }
  
}
