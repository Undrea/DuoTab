//
//  UserModel.swift
//  DuoTab
//
//  Created by Isabella Hugel on 2016-10-10.
//  Copyright © 2016 DuoTab. All rights reserved.
//

import Foundation

/// Used to describe a user as either "Me" or "SO".
///
/// - Me: The individual using the app
/// - SO: The individual's partner
enum UserType {
  case Me
  case SO
}

func ==(lhs: UserType, rhs: UserType) -> Bool {
  switch (lhs, rhs) {
  case (.Me, .Me):
    return true
  case (.SO, .SO):
    return true
  default:
    return false
  }
}
