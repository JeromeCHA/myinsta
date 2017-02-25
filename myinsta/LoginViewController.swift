//
//  LoginViewController.swift
//  myinsta
//
//  Created by Jérôme Cha on 24/02/2017.
//  Copyright © 2017 Jérôme Cha. All rights reserved.
//

import UIKit

protocol LoginViewDelegate {
  
}

class LoginViewController: GlobalViewController, UIWebViewDelegate, LoginViewDelegate {

  @IBOutlet weak var webview: UIWebView!
  
  var presenter : LoginPresenter?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    webview.delegate = self
    if let url = URL(string: Environment.Urls.kOAuth) {
      webview.loadRequest(URLRequest(url: url))
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  //MARK: - UIWebViewDelegate
  func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
    if let url = request.url?.absoluteString, url.contains("access_token") {
      self.retrieveAccessToken(url: url)
    }
    return true
  }
  
  //MARK: - LoginViewDelegate
  
}

