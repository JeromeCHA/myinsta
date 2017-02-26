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
    static let kProfile = "ProfileViewController"
    static let kHome = "HomeViewController"
    static let kDetail = "DetailViewController"
  }
  
  // all navigation controllers
  struct NavigationControllers {
    static let kHome = "HomeNavigationController"
  }
  
  // Storyboards Name
  struct Storyboards {
    static let kMain = "Main" 
  }
  
  // All tableViewCell id
  struct TableViewCells {
    static let kMediaRecent = "MediaRecentTableViewCell"
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
    
    static let kProfileCountsMedia = "profile_counts_media"
    static let kProfileCountsFollows = "profile_counts_follows"
    static let kProfileCountsFollowers = "profile_counts_followers"
    
    static let kMediaLike = "media_like"
    
    static let kToolbarTitleProfile = "toolbar_title_profile"
    static let kToolbarTitleRecent = "toolbar_title_recent"
    static let kToolbarTitleDetail = "toolbar_title_detail"
  }
  
}
