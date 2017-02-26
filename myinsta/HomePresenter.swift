//
//  HomePresenter.swift
//  myinsta
//
//  Created by Jérôme Cha on 26/02/2017.
//  Copyright © 2017 Jérôme Cha. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class HomePresenter: NSObject {
  
  var viewDelegate : HomeViewDelegate?
  var router : HomeRouter?
  var getMediaRecentInteractor : GetMediaRecentInteractor?
  
  fileprivate let disposeBag = DisposeBag()
  
  func getMediaRecent() {
    self.getMediaRecentInteractor?.getMediaRecent()
      .observeOn(MainScheduler.asyncInstance)
      .subscribe(onNext: { (mediaRecentResponseEntity) in
        // update view
        self.viewDelegate?.updateListMedia(mediaRecentResponseEntity)
      }, onError: { (error) in
        // display error
        self.viewDelegate?.displayErrorMessage()
      }).addDisposableTo(self.disposeBag)
  }

  //MARK: - Redirect
  func goToViewController(_ viewController:UIViewController) {
    self.router?.goToViewController(viewController)
  }
  
  func goToDetailViewController(_ url:String) {
    self.router?.goToDetailViewController(url)
  }
}
