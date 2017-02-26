//
//  DetailViewController.swift
//  myinsta
//
//  Created by Jérôme Cha on 27/02/2017.
//  Copyright © 2017 Jérôme Cha. All rights reserved.
//

import UIKit
import AlamofireImage

protocol DetailViewDelegate {
  
}

class DetailViewController: GlobalViewController, DetailViewDelegate {
  
  @IBOutlet weak var imageView: UIImageView!
  
  var presenter : DetailPresenter?
  var url : String?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.initImageView()
    super.updateToolbarTitle(Constantes.Strings.kToolbarTitleDetail.localized)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  fileprivate func initImageView() {
    if let link = self.url, let linkRequest = URL(string: link) {
      self.imageView.af_setImage(withURL: linkRequest)
    } else {
      self.imageView.image = nil
    }
  }
  
  //MARK: - DetailViewDelegate
}
