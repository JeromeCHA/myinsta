//
//  GetUserInfoInteractor.swift
//  myinsta
//
//  Created by Jérôme Cha on 25/02/2017.
//  Copyright © 2017 Jérôme Cha. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import Moya
import Moya_ObjectMapper

class GetUserInfoInteractor: NSObject {

  func getUserInfo() -> Observable<UserInfoResponseEntity> {
    let provider = RxMoyaProvider<InstagramService>()
    return provider.request(InstagramService.userInfo).mapObject(UserInfoResponseEntity.self)
  }
  
}
