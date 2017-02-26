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
  case userInfo
  case mediaRecent
}

// MARK: - TargetType Protocol Implementation
extension InstagramService: TargetType {
  var baseURL: URL { return URL(string: Environment.Urls.kInstaAPI)! }
  
  var path: String {
    switch self {
    case .userInfo:
      return "/users/self"
    case .mediaRecent:
      return "/users/self/media/recent/"
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .userInfo, .mediaRecent:
      return .get
    }
  }
  
  var parameters: [String: Any]? {
    switch self {
    case .userInfo, .mediaRecent:
      // put the access token in the parameters
      if let accessToken = UserDefaultsManager.getString(key: Constantes.UserDefaults.kAccessToken) {
        return [Constantes.Backend.Params.kAccessToken: accessToken]
      } else {
        return nil
      }
    }
  }
  
  var parameterEncoding: ParameterEncoding {
    switch self {
    case .userInfo, .mediaRecent:
      return URLEncoding.default
    }
  }
  
  var sampleData: Data {
    switch self {
    case .userInfo, .mediaRecent:
      return "".data(using: .utf8)!
    }
  }
  
  var task: Task {
    switch self {
    case .userInfo, .mediaRecent:
      return .request
    }
  }
  
}
