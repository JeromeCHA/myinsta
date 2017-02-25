//
//  UserInfoEntity.swift
//  myinsta
//
//  Created by Jérôme Cha on 25/02/2017.
//  Copyright © 2017 Jérôme Cha. All rights reserved.
//

import UIKit
import ObjectMapper

class UserInfoEntity: Mappable {
  
  var userId : String?
  var username : String?
  var fullName : String?
  var profilePicture : String?
  var bio : String?
  var website : String?
  var counts : UserInfoCountEntity?
  
  required init?(map: Map) {
    
  }
  
  func mapping(map: Map) {
    self.userId           <- map["id"]
    self.username         <- map["username"]
    self.fullName         <- map["full_name"]
    self.profilePicture   <- map["profile_picture"]
    self.bio              <- map["bio"]
    self.website          <- map["website"]
    self.counts           <- map["counts"]
  }
  
}
