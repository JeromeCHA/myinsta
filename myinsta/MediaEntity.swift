//
//  MediaEntity.swift
//  myinsta
//
//  Created by Jérôme Cha on 26/02/2017.
//  Copyright © 2017 Jérôme Cha. All rights reserved.
//

import UIKit
import ObjectMapper

class MediaEntity: Mappable {
  
  var mediaId : String?
  var type : String?
  var filter : String?
  var user : MediaUserEntity?
  var userHasLiked : Bool?
  var comments : MediaCommentEntity?
  var caption : MediaCaptionEntity?
  var likes : MediaLikeEntity?
  var link : String?
  var createdTime : String?
  var images : MediaImageEntity?
  var tags : [String]?
  var videos : MediaVideoEntity?
  
  required init?(map: Map) {
    
  }
  
  func mapping(map: Map) {
    self.mediaId        <- map["id"]
    self.type           <- map["type"]
    self.filter         <- map["filter"]
    self.user           <- map["user"]
    self.userHasLiked   <- map["user_has_liked"]
    self.comments       <- map["comments"]
    self.caption        <- map["caption"]
    self.likes          <- map["likes"]
    self.link           <- map["link"]
    self.createdTime    <- map["created_time"]
    self.images         <- map["images"]
    self.tags           <- map["tags"]
    self.videos         <- map["videos"]
  }
  
}
