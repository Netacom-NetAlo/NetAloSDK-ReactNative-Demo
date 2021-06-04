//
//  Test.swift
//  TestReactNativeV3
//
//  Created by Tran Phong on 4/16/21.
//  Copyright © 2021 Facebook. All rights reserved.
//

import Foundation
import NetaloUISDK

@objc public class MockNetAloUser: NSObject, NetaloUser {
  
  public var id: Int64
  
  public var phoneNumber: String
  
  public var email: String
  
  public var fullName: String
  
  public var avatarUrl: String
  
  public var session: String
  
  @objc
  public init(id: Int64, phoneNumber: String, email: String, fullName: String, avatarUrl: String, session: String) {
    self.id = id
    self.phoneNumber = phoneNumber
    self.email = email
    self.fullName = fullName
    self.avatarUrl = avatarUrl
    self.session = session
  }
}
