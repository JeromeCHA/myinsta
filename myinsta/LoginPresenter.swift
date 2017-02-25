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
    // retreive the access token
    retreiveTokenInteractor?.retrieveAccessToken(url: url)
      .observeOn(MainScheduler.asyncInstance)
      .subscribe(onError: { (error) in
        // Display message
        self.viewDelegate?.displayErrorMessage()
      }, onCompleted: {
        // Success -> go to home
        self.router?.goToHome()
      }).addDisposableTo(self.disposeBag)
  }
  
}
