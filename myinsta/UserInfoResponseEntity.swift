//
//  UserInfoResponseEntity.swift
//  myinsta
//
//  Created by Jérôme Cha on 25/02/2017.
//  Copyright © 2017 Jérôme Cha. All rights reserved.
//

import UIKit
import ObjectMapper

class UserInfoResponseEntity: Mappable {

  var data : UserInfoEntity?
  
  required init?(map: Map) {
    
  }
  
  func mapping(map: Map) {
    self.data   <- map["data"]
  }
  
}
