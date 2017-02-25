//
//  InstagramService.swift
//  myinsta
//
//  Created by Jérôme Cha on 25/02/2017.
//  Copyright © 2017 Jérôme Cha. All rights reserved.
//

import UIKit
import Moya

enum InstagramService {
  //https://api.instagram.com/oauth/authorize/?client_id=CLIENT-ID&redirect_uri=REDIRECT-URI&response_type=token
  case oauth(clientId:String, redirectUri:String, responseType:String)
}

// MARK: - TargetType Protocol Implementation
extension InstagramService: TargetType {
  var baseURL: URL { return URL(string: Environment.BaseUrls.kInstagram)! }
  
  var path: String {
    switch self {
    case .oauth:
      return "/oauth/authorize"
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .oauth:
      return .get
    }
  }
  
  var parameters: [String: Any]? {
    switch self {
    case .oauth(let clientId, let redirectUri, let responseType):
      return ["client_id": clientId,
              "redirect_uri":redirectUri,
              "response_type":responseType]
    }
  }
  
  var parameterEncoding: ParameterEncoding {
    switch self {
    case .oauth:
      return URLEncoding.default
    }
  }
  
  var sampleData: Data {
    switch self {
    case .oauth:
      return "".data(using: .utf8)!
    }
  }
  
  var task: Task {
    switch self {
    case .oauth:
      return .request
    }
  }
  
}
