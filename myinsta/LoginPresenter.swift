//
//  LoginPresenter.swift
//  myinsta
//
//  Created by Jérôme Cha on 25/02/2017.
//  Copyright © 2017 Jérôme Cha. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class LoginPresenter: NSObject {

  var viewDelegate : LoginViewDelegate?
  var router : LoginRouter?
  var retreiveTokenInteractor : RetreiveTokenInteractor?
  
  fileprivate let disposeBag = DisposeBag()
  
  func retrieveAccessToken(url:String) {
    retreiveTokenInteractor?.retrieveAccessToken(url: url)
      .flatMap({ (accessToken) -> ObservableConvertibleType in
        <#code#>
      })
      .observeOn(MainScheduler.asyncInstance)
      .subscribe(onNext: { (<#String#>) in
      <#code#>
    }, onError: <#T##((Error) -> Void)?##((Error) -> Void)?##(Error) -> Void#>, onCompleted: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>, onDisposed: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>)
  }
  
}
