//
//  MediaRecentTableViewCell.swift
//  myinsta
//
//  Created by Jérôme Cha on 26/02/2017.
//  Copyright © 2017 Jérôme Cha. All rights reserved.
//

import UIKit
import AlamofireImage

class MediaRecentTableViewCell: UITableViewCell {
  @IBOutlet weak var personalInfoStackView: UIStackView!
  @IBOutlet weak var profilePictureImageView: UIImageView!
  @IBOutlet weak var usernameLabel: UILabel!
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var mediaImageView: UIImageView!
  @IBOutlet weak var likeLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  
  static let HEIGHT = 462.0
  
  override func awakeFromNib() {
    super.awakeFromNib()
    self.profilePictureImageView.rounded()
    self.contentView.autoresizingMask = UIViewAutoresizing.flexibleHeight
    self.selectionStyle = .none
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
  func initDatas(_ data:MediaEntity) { 
    if let profilePicUrl = data.user?.profilePicture, let url = URL(string: profilePicUrl) {
      self.profilePictureImageView.af_setImage(withURL: url)
    } else {
      self.profilePictureImageView.image = nil
    }
    
    if let username = data.user?.username {
      self.usernameLabel.text = username
    } else {
      self.usernameLabel.text = ""
    }
    
    if let createdTime = data.createdTime, let dateDouble = Double(createdTime) {
      let createdDate = Date(timeIntervalSince1970: dateDouble)
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "yyyy-MM-dd"//this your string date format
      dateFormatter.locale = Locale(identifier: "ja_JP")
      self.dateLabel.text = dateFormatter.string(from: createdDate)
    } else {
      self.dateLabel.text = ""
    }
    
    if let lowResImageUrl = data.images?.lowResolution?.url, let url = URL(string: lowResImageUrl) {
      self.mediaImageView.af_setImage(withURL: url)
    } else {
      self.mediaImageView.image = nil
    }
    
    self.likeLabel.text = String.init(format: Constantes.Strings.kMediaLike.localized, data.likes?.count ?? 0)
    
    if let description = data.caption?.text {
      self.descriptionLabel.text = description
      self.descriptionLabel.isHidden = false
    } else {
      self.descriptionLabel.text = ""
      self.descriptionLabel.isHidden = true
    }
  }
  
}
