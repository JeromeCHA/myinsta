//
//  GlobalRouter.swift
//  myinsta
//
//  Created by Jérôme Cha on 25/02/2017.
//  Copyright © 2017 Jérôme Cha. All rights reserved.
//

import UIKit

class GlobalRouter: NSObject {
  
  // get the view controller from the storyboard with his storyboard id
  func getUIViewControllerFromStoryboard(storyboardName:String, viewControllerName:String) -> UIViewController {
    let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
    return storyboard.instantiateViewController(withIdentifier: viewControllerName)
  }
  
  // present a view controller without navigation controller
  func presentViewController(from viewController:UIViewController, to destinationViewController:UIViewController) {
    viewController.present(destinationViewController, animated: true, completion: nil)
  }
  
  // present a view controller to the navigation controller
  func presentViewControllerWithNavigationController(from viewController:UIViewController, to destinationViewController:UIViewController) {
    if let navController = viewController.navigationController {
      navController.pushViewController(destinationViewController, animated: true)
    }
  }
  
  // go back
  func goBack(viewController:UIViewController) {
    if let navController = viewController.navigationController {
      let _ = navController.popViewController(animated: true)
    }
  }

}
