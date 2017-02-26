//
//  MediaVideoEntity.swift
//  myinsta
//
//  Created by Jérôme Cha on 26/02/2017.
//  Copyright © 2017 Jérôme Cha. All rights reserved.
//

import UIKit
import ObjectMapper

class MediaVideoEntity: Mappable {

  var lowBandwidth : MediaResolutionEntity?
  var lowResolution : MediaResolutionEntity?
  var standardResolution : MediaResolutionEntity?
  
  required init?(map: Map) {
    
  }
  
  func mapping(map: Map) {
    self.lowBandwidth       <- map["low_bandwidth"]
    self.lowResolution      <- map["low_resolution"]
    self.standardResolution <- map["standard_resolution"]
  }
  
}
