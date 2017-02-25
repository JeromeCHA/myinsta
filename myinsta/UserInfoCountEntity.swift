//
//  UserInfoCountEntity.swift
//  myinsta
//
//  Created by Jérôme Cha on 25/02/2017.
//  Copyright © 2017 Jérôme Cha. All rights reserved.
//

import UIKit
import ObjectMapper

class UserInfoCountEntity: Mappable {
  
  var media : Int?
  var follows : Int?
  var followedBy : Int?
  
  required init?(map: Map) {
    
  }
  
  func mapping(map: Map) {
    self.media      <- map["media"]
    self.follows    <- map["follows"]
    self.followedBy <- map["followed_by"]
  }
}
