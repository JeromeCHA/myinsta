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
import SVProgressHUD

class LoginPresenter: NSObject {

  var viewDelegate : LoginViewDelegate?
  var router : LoginRouter?
  var retreiveTokenInteractor : RetreiveTokenInteractor?
  
  fileprivate let disposeBag = DisposeBag()
  
  func retrieveAccessToken(url:String) {
    SVProgressHUD.show()
    // retreive the access token
    retreiveTokenInteractor?.retrieveAccessToken(url: url)
      .observeOn(MainScheduler.asyncInstance)
      .subscribe(onError: { (error) in
        // Display message
        self.viewDelegate?.displayErrorMessage()
      }, onCompleted: {
        SVProgressHUD.dismiss()
        // Success -> go to Profile
        self.router?.goToProfile()
      }).addDisposableTo(self.disposeBag)
  }
  
}
