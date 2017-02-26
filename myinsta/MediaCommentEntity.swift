//
//  MediaCommentEntity.swift
//  myinsta
//
//  Created by Jérôme Cha on 26/02/2017.
//  Copyright © 2017 Jérôme Cha. All rights reserved.
//

import UIKit
import ObjectMapper

class MediaCommentEntity: Mappable {

  var count : Int?
  
  required init?(map: Map) {
    
  }
  
  func mapping(map: Map) {
    self.count   <- map["data"]
  }
  
}
