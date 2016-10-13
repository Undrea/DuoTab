//
//  ViewController.swift
//  DuoTab
//
//  Created by Isabella Hugel on 2016-10-08.
//  Copyright © 2016 DuoTab. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
  @IBOutlet weak var balanceHeaderLabel: UILabel!
  @IBOutlet weak var balanceAmountLabel: UILabel!
  @IBOutlet weak var settleButton: UIButton!
  @IBOutlet weak var contentContainer: UIView!
  
  @IBOutlet weak var partnerPayButton: UIButton!
  @IBOutlet weak var mePayButton: UIButton!
  
  /// Initialize the view model with the saved balance (or 0) and the history of transactions
  let viewModel = HomeViewModel(withBalance: BalanceModel.loadBalance() ?? BalanceModel(amount: 0), withHistory: HistoryModel()) // TODO: Add real histroy
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    balanceHeaderLabel.text = viewModel.balanceHeaderText
    balanceAmountLabel.text = viewModel.balanceOwingAmount
    
    // TODO: Add history element if history is present; otherwise, show initial onboarding for the empty state
  }
}

// MARK: - Actions
extension HomeViewController {
  
}

