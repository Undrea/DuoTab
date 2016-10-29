//
//  Balance.swift
//  DuoTab
//
//  Created by Isabella Hugel on 2016-10-10.
//  Copyright © 2016 DuoTab. All rights reserved.
//

import Foundation

/// Maintains the running tab between a couple.
struct BalanceModel {
  /// Currency stored in cents. Sign indicates who is owing who.
  var balanceInCents: Int
  
  /// Creates a BalanceModel, rounding the passed amount to the nearest cent.
  ///
  /// - parameter amount: The monetary amount in dollars and sense. (e.g. 19.99)
  init(amount: Double) {
    let roundedAmount = round(amount * 100) / 100.0
    balanceInCents = Int(roundedAmount * 100) // Convert cents
  }
  
  // MARK: - Getters
  
  /// The balance in typical currency format (dollars and cents rounded to the nearest cent). Sign indicates who is owing who.
  var balance: Double {
    return Double(balanceInCents)/100.0 // Convert back to dollars; no rounding necessary as we stored total to the nearest cent
  }
  
  /// Returns the dollars portion of the total currency stored in the object (i.e. unrounded).
  var dollars: String {
    return "\(Int(abs(balance)))"
  }
  
  /// Returns the cents from the amount, rounded to the nearest cent.
  var cents: String {
    return "\(abs(balanceInCents % 100))" // Round to two decimal places
  }
  
  /// Returns the amount as a currency value in absolute terms.
  var currencyValue: String? {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    
    return formatter.string(from: NSNumber(value: abs(balance)))
  }
  
  /// If the balance is positive, then "Me" owes "SO", if the balance is negative, then "SO" owes "Me". Nil means no user is owing.
  var userOwing: UserType? {
    if balanceInCents > 0 {
      return UserType.SO
    } else if balanceInCents < 0 {
      return UserType.Me
    } else /* amount == 0 */ {
      return nil // A zero balance means neither user is owing
    }
  }
}
