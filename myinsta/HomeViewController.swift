//
//  HomeViewController.swift
//  myinsta
//
//  Created by Jérôme Cha on 25/02/2017.
//  Copyright © 2017 Jérôme Cha. All rights reserved.
//

import UIKit
import AlamofireImage

protocol HomeViewDelegate {
  func displayErrorMessage()
  func initDatas(_ userInfoDatas:UserInfoEntity)
}

class HomeViewController: GlobalViewController, HomeViewDelegate {
  @IBOutlet weak var profilePictureImageView: UIImageView!
  @IBOutlet weak var usernameLabel: UILabel!
  @IBOutlet weak var bioLabel: UILabel!
  @IBOutlet weak var nbMediaLabel: UILabel!
  @IBOutlet weak var nbFollowLabel: UILabel!
  @IBOutlet weak var nbFollowedByLabel: UILabel!
  
  var presenter : HomePresenter?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.profilePictureImageView.rounded()
    self.presenter?.getUserInfo()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  //MARK: - HomeViewDelegate
  func displayErrorMessage() {
    self.showAlert(title: Constantes.Strings.kAlertTitleError.localized, message: Constantes.Strings.kAlertMessageError.localized)
  }
  
  // init datas
  func initDatas(_ userInfoDatas:UserInfoEntity) {
    self.usernameLabel.text = userInfoDatas.username
    self.bioLabel.text = userInfoDatas.bio
    
    // use alamofire to get image
    if let profilePicUrl = userInfoDatas.profilePicture, let url = URL(string: profilePicUrl) {
      self.profilePictureImageView.af_setImage(withURL: url)
    }
    
    if let count = userInfoDatas.counts {
      self.nbMediaLabel.text = String.init(format: Constantes.Strings.kHomeCountsMedia.localized, count.media ?? 0)
      self.nbFollowLabel.text = String.init(format: Constantes.Strings.kHomeCountsFollows.localized, count.follows ?? 0)
      self.nbFollowedByLabel.text = String.init(format: Constantes.Strings.kHomeCountsFollowers.localized, count.followedBy ?? 0)
    }
  }
}
