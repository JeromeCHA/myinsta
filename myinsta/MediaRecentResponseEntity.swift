//
//  MediaRecentResponseEntity.swift
//  myinsta
//
//  Created by Jérôme Cha on 26/02/2017.
//  Copyright © 2017 Jérôme Cha. All rights reserved.
//

import UIKit
import ObjectMapper

class MediaRecentResponseEntity: Mappable {

  var data : [MediaEntity]?
  
  required init?(map: Map) {
    
  }
  
  func mapping(map: Map) {
    self.data   <- map["data"]
  }
}
