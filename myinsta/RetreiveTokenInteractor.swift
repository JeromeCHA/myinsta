//
//  RetreiveTokenInteractor.swift
//  myinsta
//
//  Created by Jérôme Cha on 24/02/2017.
//  Copyright © 2017 Jérôme Cha. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

enum RetreiveTokenInteractorError : Error {
  case emptyAccessToken
  case cannotGetAccessToken
}

class RetreiveTokenInteractor: NSObject {
  
  // The regex will be use to retreive access token from URL
  fileprivate let regexp = "[^=]+$"
  
  // Retrieve and save access token
  // with a regex
  func retrieveAccessToken(url:String) -> Observable<String> {
    return Observable.create({ observer in
      let cancel = Disposables.create()
      
      if let accessToken = url.retrieveFrom(regex: self.regexp) {
        #if DEBUG
          print("URL : \(url)")
          print("REGEX : \(accessToken)")
        #endif
        // if the access_token is not empty, save it on the UserDefaults
        if accessToken != "" {
          // save the access_token
          UserDefaultsManager.saveString(key: Constantes.UserDefaults.kAccessToken, andValue: accessToken)
          observer.onNext(accessToken)
          observer.onCompleted()
        } else {
          observer.onError(RetreiveTokenInteractorError.emptyAccessToken)
        }
      } else {
        observer.onError(RetreiveTokenInteractorError.cannotGetAccessToken)
      }
      return cancel
    })
  }
}
