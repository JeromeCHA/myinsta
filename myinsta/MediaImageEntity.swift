//
//  MediaImageEntity.swift
//  myinsta
//
//  Created by Jérôme Cha on 26/02/2017.
//  Copyright © 2017 Jérôme Cha. All rights reserved.
//

import UIKit
import ObjectMapper

class MediaImageEntity: Mappable {
  
  var lowResolution : MediaResolutionEntity?
  var thumbnail : MediaResolutionEntity?
  var standardResolution : MediaResolutionEntity?

  required init?(map: Map) {
    
  }
  
  func mapping(map: Map) {
    self.lowResolution      <- map["low_resolution"]
    self.thumbnail          <- map["thumbnail"]
    self.standardResolution <- map["standard_resolution"]
  }
  
}
