//
//  HomeViewModel.swift
//  DuoTab
//
//  Created by Isabella Hugel on 2016-10-10.
//  Copyright © 2016 DuoTab. All rights reserved.
//

import Foundation

struct HomeViewModel {
  let balanceHeaderText: String
  let balanceOwingAmount: String
  let historyAbbreviated: [TransactionModel]
  
  init(withBalance balance: BalanceModel, withHistory history: HistoryModel) {
    if let userOwing = balance.userOwing {
      switch userOwing {
        case .Me:
        balanceHeaderText = "Currently, I owe my partner:"
        case .SO:
        balanceHeaderText = "Currently, my partner owes me:"
      }
    } else { // No one currently owes anyone money
      balanceHeaderText = "Balance:"
    }
    
    balanceOwingAmount = balance.currencyValue ?? ""
    
    // Only show the last ten transactions at most
    if history.transactions.count <= 10 {
      historyAbbreviated = Array(history.transactions[0..<10])
    } else {
      historyAbbreviated = history.transactions
    }
  }
  
}
