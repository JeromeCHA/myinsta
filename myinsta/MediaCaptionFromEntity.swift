
//
//  MediaCaptionFromEntity.swift
//  myinsta
//
//  Created by Jérôme Cha on 26/02/2017.
//  Copyright © 2017 Jérôme Cha. All rights reserved.
//

import UIKit
import ObjectMapper

class MediaCaptionFromEntity: Mappable {
  
  var username : String?
  var fullname : String?
  var profilePicture : String?
  var captionFromId : String?

  required init?(map: Map) {
    
  }
  
  func mapping(map: Map) {
    self.username       <- map["username"]
    self.fullname       <- map["full_name"]
    self.profilePicture <- map["profile_picture"]
    self.captionFromId  <- map["id"]
  }
  
}
