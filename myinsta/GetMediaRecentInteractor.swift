//
//  GetMediaRecentInteractor.swift
//  myinsta
//
//  Created by Jérôme Cha on 26/02/2017.
//  Copyright © 2017 Jérôme Cha. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import Moya
import Moya_ObjectMapper

class GetMediaRecentInteractor: NSObject {

  func getMediaRecent() -> Observable<MediaRecentResponseEntity> {
    let provider = RxMoyaProvider<InstagramService>()
    return provider.request(InstagramService.mediaRecent).mapObject(MediaRecentResponseEntity.self)
  }
  
}
