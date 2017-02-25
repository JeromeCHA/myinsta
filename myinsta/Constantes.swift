//
//  Constantes.swift
//  myinsta
//
//  Created by Jérôme Cha on 25/02/2017.
//  Copyright © 2017 Jérôme Cha. All rights reserved.
//

import UIKit

struct Constantes {

  // all ViewControllers Storyboard ID
  struct ViewControllers {
    static let kLogin = "LoginViewController"
    static let kHome = "HomeViewController"
  }
  
  // all navigation controllers
  struct NavigationControllers {
    static let kHome = "HomeNavigationController"
  }
  
  // Storyboards Name
  struct Storyboards {
    static let kMain = "Main" 
  }
  
  // All about backend
  struct Backend {
    
    // Query Params
    struct Params {
      static let kAccessToken = "access_token"
    }
    
  }
  
  // All user defaults
  struct UserDefaults {
    static let kAccessToken = "access_token"
  }
  
  // Localizable Strings keys
  struct Strings {
    static let kButtonClose = "button_close"
    static let kAlertTitleError = "alert_title_error"
    static let kAlertMessageError = "alert_message_error"
    
    static let kHomeCountsMedia = "home_counts_media"
    static let kHomeCountsFollows = "home_counts_follows"
    static let kHomeCountsFollowers = "home_counts_followers"
  }
  
}
