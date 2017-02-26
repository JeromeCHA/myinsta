//
//  HomeViewController.swift
//  myinsta
//
//  Created by Jérôme Cha on 26/02/2017.
//  Copyright © 2017 Jérôme Cha. All rights reserved.
//

import UIKit

protocol HomeViewDelegate {
  func displayErrorMessage()
  func updateListMedia(_ mediaRecentResponseEntity:MediaRecentResponseEntity)
}

class HomeViewController: GlobalViewController, HomeViewDelegate, UITableViewDelegate, UITableViewDataSource, UIViewControllerPreviewingDelegate {
  
  @IBOutlet weak var tableView: UITableView!
  
  var presenter : HomePresenter?
  
  var listMedia : [MediaEntity] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.initTableView()
    self.init3DTouch()
    self.presenter?.getMediaRecent()
    super.updateToolbarTitle(Constantes.Strings.kToolbarTitleRecent.localized)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  fileprivate func init3DTouch() {
    if(traitCollection.forceTouchCapability == .available){
      self.registerForPreviewing(with: self, sourceView: self.view)
    }
  }
  
  fileprivate func initTableView() {
    self.tableView.delegate = self
    self.tableView.dataSource = self
    self.tableView.register(UINib(nibName: Constantes.TableViewCells.kMediaRecent, bundle: nil), forCellReuseIdentifier: Constantes.TableViewCells.kMediaRecent)
    self.tableView.tableFooterView = UIView(frame: CGRect.zero)
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, self.bottomLayoutGuide.length, 0)
    self.tableView.rowHeight = UITableViewAutomaticDimension
    self.tableView.separatorStyle = .none
    self.tableView.estimatedRowHeight = CGFloat(MediaRecentTableViewCell.HEIGHT)
  }
  
  //MARK: - UITableViewDelegate
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableViewAutomaticDimension
  }
  
  //MARK: - UITableViewDataSource
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.listMedia.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: Constantes.TableViewCells.kMediaRecent) as! MediaRecentTableViewCell
    cell.initDatas(self.listMedia[indexPath.row])
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if let imageUrl = self.listMedia[indexPath.row].images?.lowResolution?.url {
      self.presenter?.goToDetailViewController(imageUrl)
    }
  }
  
  //MARK: - UIViewControllerPreviewingDelegate
  func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
    self.presenter?.goToViewController(viewControllerToCommit)
  }
  
  func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {    
    guard let indexPath = tableView.indexPathForRow(at: tableView.convert(location, from: view)) else {
      return nil
    }
    
    guard let imageUrl = self.listMedia[indexPath.row].images?.lowResolution?.url, let detailViewController = DetailRouter().getInitViewController(url: imageUrl) else {
      return nil
    }
    
    return detailViewController
  }
  
  //MARK: - HomeViewDelegate
  func displayErrorMessage() {
    self.showAlert(title: Constantes.Strings.kAlertTitleError.localized, message: Constantes.Strings.kAlertMessageError.localized)
  }
  
  func updateListMedia(_ mediaRecentResponseEntity:MediaRecentResponseEntity) {
    if let data = mediaRecentResponseEntity.data {
      self.listMedia = data
      self.tableView.reloadData()
    }
  }
}
