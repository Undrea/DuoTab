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
  
  @IBOutlet weak var balanceDollarsLabel: UILabel!
  @IBOutlet weak var balanceCentsLabel: UILabel!
  
  @IBOutlet weak var settleButton: UIButton!
  @IBOutlet weak var contentContainer: UIView!
  
  @IBOutlet weak var mePayButton: UIButton! {
    didSet {
      initialize(expenseButton: mePayButton, withImageNamed: "heartLeft")
      mePayButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 5.0, bottom: 20.0, right: 0)
    }
  }
  @IBOutlet weak var partnerPayButton: UIButton! {
    didSet {
      initialize(expenseButton: partnerPayButton, withImageNamed: "heartRight")
      partnerPayButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 20.0, right: 5.0)
    }
  }
  
  /// Initialize the view model with the saved balance (or 0) and the history of transactions
  let viewModel = HomeViewModel(withBalance: BalanceModel.loadBalance() ?? BalanceModel(amount: 0), withHistory: HistoryModel()) // TODO: Add real histroy
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    balanceHeaderLabel.text = viewModel.balanceHeaderText
    balanceDollarsLabel.text = viewModel.dollarsWithDecimal
    balanceCentsLabel.text = viewModel.cents
    
    // TODO: Add history element if history is present; otherwise, show initial onboarding for the empty state
  }
}

// MARK: - Actions
extension HomeViewController {
  
}

// MARK: - Helpers
extension HomeViewController {
  /// Use a single vector image and recolour it for the various "heart" expense button states.
  ///
  /// - parameter expenseButton: The expense-related button to set the state images for.
  /// - parameter imageName:     Name of the image to apply to the button.
  func initialize(expenseButton: UIButton, withImageNamed imageName: String) {
    if let image = UIImage(named: imageName) {
      expenseButton.setBackgroundImage(image.imageWithColor("#F44336".hexColor), for: UIControlState.normal)
      expenseButton.setBackgroundImage(image.imageWithColor("#FF8A80".hexColor), for: UIControlState.highlighted)
    }
  }
}
