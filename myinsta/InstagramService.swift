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
}

// MARK: - TargetType Protocol Implementation
extension InstagramService: TargetType {
  var baseURL: URL { return URL(string: Environment.Urls.kInstaAPI)! }
  
  var path: String {
    switch self {
    case .userInfo:
      return "/users/self"
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .userInfo:
      return .get
    }
  }
  
  var parameters: [String: Any]? {
    switch self {
    case .userInfo:
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
    case .userInfo:
      return URLEncoding.default
    }
  }
  
  var sampleData: Data {
    switch self {
    case .userInfo:
      return "".data(using: .utf8)!
    }
  }
  
  var task: Task {
    switch self {
    case .userInfo:
      return .request
    }
  }
  
}
