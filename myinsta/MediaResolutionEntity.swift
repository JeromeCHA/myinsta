//
//  MediaResolutionEntity.swift
//  myinsta
//
//  Created by Jérôme Cha on 26/02/2017.
//  Copyright © 2017 Jérôme Cha. All rights reserved.
//

import UIKit
import ObjectMapper

class MediaResolutionEntity: Mappable {
  
  var url : String?
  var width : Int?
  var height : Int?
  
  required init?(map: Map) {
    
  }
  
  func mapping(map: Map) {
    self.url      <- map["url"]
    self.width    <- map["width"]
    self.height   <- map["height"]
  }
}
