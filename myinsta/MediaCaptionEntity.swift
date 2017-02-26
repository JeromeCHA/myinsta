//
//  MediaCaptionEntity.swift
//  myinsta
//
//  Created by Jérôme Cha on 26/02/2017.
//  Copyright © 2017 Jérôme Cha. All rights reserved.
//

import UIKit
import ObjectMapper

class MediaCaptionEntity: Mappable {

  var createdTime : String?
  var text : String?
  var from : MediaCaptionFromEntity?
  var captionId : String?
  
  required init?(map: Map) {
    
  }
  
  func mapping(map: Map) {
    self.createdTime    <- map["created_time"]
    self.text           <- map["text"]
    self.from           <- map["from"]
    self.captionId      <- map["id"]
  }
  
}
