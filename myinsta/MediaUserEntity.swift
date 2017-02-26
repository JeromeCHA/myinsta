//
//  MediaUserEntity.swift
//  myinsta
//
//  Created by Jérôme Cha on 26/02/2017.
//  Copyright © 2017 Jérôme Cha. All rights reserved.
//

import UIKit
import ObjectMapper

class MediaUserEntity: Mappable {
  var fullname : String?
  var userId : String?
  var username : String?
  var profilePicture : String?
  
  required init?(map: Map) {
    
  }
  
  func mapping(map: Map) {
    self.fullname         <- map["full_name"]
    self.userId           <- map["id"]
    self.username         <- map["username"]
    self.profilePicture   <- map["profile_picture"]
  }
  
}
