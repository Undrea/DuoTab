//
//  BalanceModel+Store.swift
//  DuoTab
//
//  Created by Isabella Hugel on 2016-10-10.
//  Copyright © 2016 DuoTab. All rights reserved.
//

import Foundation

// MARK: - Extend the BalanceModel to load from and save to NSUserDefaults. 
//         Note that the key is optionally passed in for testability.
extension BalanceModel {
  /// Overwrite the currently persisted balance with this balance.
  func save(forKey: String = StoreKey.Balance.rawValue) {
    let defaults = UserDefaults.standard
    defaults.set(amount, forKey: forKey)
  }
  
  /// Load from memory the saved balance.
  ///
  /// - returns: Returns the balance model, or nil if no balance has yet been saved.
  static func loadBalance(forKey: String = StoreKey.Balance.rawValue) -> BalanceModel? {
    let defaults = UserDefaults.standard
    
    if let amount = defaults.object(forKey: forKey) as? Double {
      return BalanceModel(amount: amount)
    } else {
      return nil
    }
  }
}
