//
//  HomePresenter.swift
//  myinsta
//
//  Created by Jérôme Cha on 25/02/2017.
//  Copyright © 2017 Jérôme Cha. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class HomePresenter: NSObject {
  
  var viewDelegate : HomeViewDelegate?
  var router : HomeRouter?
  var getUserInfoInteractor : GetUserInfoInteractor?

  fileprivate let disposeBag = DisposeBag()
  
  func getUserInfo() {
    // get user profile infos
    self.getUserInfoInteractor?.getUserInfo()
      .observeOn(MainScheduler.asyncInstance)
      .subscribe(onNext: { (userInfoResponseEntity) in
        // update view
        if let data = userInfoResponseEntity.data {
          self.viewDelegate?.initDatas(data)
        }
      }, onError: { (error) in
        // display error
        self.viewDelegate?.displayErrorMessage()
      }).addDisposableTo(self.disposeBag)
  }
  
}
