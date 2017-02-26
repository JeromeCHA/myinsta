//
//  ProfilePresenter.swift
//  myinsta
//
//  Created by Jérôme Cha on 25/02/2017.
//  Copyright © 2017 Jérôme Cha. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import SVProgressHUD

class ProfilePresenter: NSObject {
  
  var viewDelegate : ProfileViewDelegate?
  var router : ProfileRouter?
  var getUserInfoInteractor : GetUserInfoInteractor?

  fileprivate let disposeBag = DisposeBag()
  
  func getUserInfo() {
    SVProgressHUD.show()
    // get user profile infos
    self.getUserInfoInteractor?.getUserInfo()
      .observeOn(MainScheduler.asyncInstance)
      .subscribe(onNext: { (userInfoResponseEntity) in
        SVProgressHUD.dismiss()
        // update view
        if let data = userInfoResponseEntity.data {
          self.viewDelegate?.initDatas(data)
        }
      }, onError: { (error) in
        SVProgressHUD.dismiss()
        // display error
        self.viewDelegate?.displayErrorMessage()
      }).addDisposableTo(self.disposeBag)
  }
  
}
