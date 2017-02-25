//
//  Environment.swift
//  myinsta
//
//  Created by Jérôme Cha on 25/02/2017.
//  Copyright © 2017 Jérôme Cha. All rights reserved.
//

import UIKit

struct Environment {
  
  struct Keys {
    static let kInstaClientId = "3d3717d462a047f18f7fb5f10be82a6b"
  }
  
  struct BaseUrls {
    static let kInstagram = "https://api.instagram.com"
  }
  
  struct Urls {
    static let kRedirectUri = "http://localhost"
    static let kOAuth = "\(Environment.BaseUrls.kInstagram)/oauth/authorize/?client_id=\(Environment.Keys.kInstaClientId)&redirect_uri=\(kRedirectUri)&response_type=token"
  }

}
