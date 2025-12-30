//
//  ReminderFlowController.swift
//  Reminder
//
//  Created by Bruna Porato on 03/11/25.
//

import Foundation
import UIKit

class ReminderFlowController {
    // MARK: - Properties
    private var navigationController: UINavigationController?
    private let viewControllerFactory: ViewControllersFactoryProtocol
//    private let viewControllerFactory
    
    // MARK: - init
    public init() {
        self.viewControllerFactory = ViewControllersFactory()
    }
    
    // MARK: - startFlow
    func start() -> UINavigationController? {
        let startViewController = viewControllerFactory.makeSplashViewController(flowDelegate: self)
        self.navigationController = UINavigationController(rootViewController: startViewController)
        return navigationController
    }
}

// MARK: - Splash
extension ReminderFlowController: SplashFlowDelegate {
    func showLoginBottomSheet() {
        let loginBottomSheet = viewControllerFactory.makeLoginBottomSheetViewController(flowDelegate: self)
        loginBottomSheet.modalPresentationStyle = .overCurrentContext
        loginBottomSheet.modalTransitionStyle = .crossDissolve
        navigationController?.present(loginBottomSheet, animated: false) {
            loginBottomSheet.animateShow()
        }
    }
}

// MARK: - Login
extension ReminderFlowController: LoginBottomSheetFlowDelegate {
    func navigateToHome() {
        self.navigationController?.dismiss(animated: false)
        let viewController = viewControllerFactory.makeHomeViewController(flowDelegate: self)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: - Home
extension ReminderFlowController: HomeFlowDelegate {
    func navigateToNewReceipts() {
        let receiptViewController = viewControllerFactory.makeNewReceiptViewController()
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.pushViewController(receiptViewController, animated: true)
    }
    
    func navigateToMyReceipts() {
        let myReceiptsViewController = viewControllerFactory.makeMyReceiptsViewController(flowDelegate: self)
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.pushViewController(myReceiptsViewController, animated: true)
    }
    
    func logOut() {
        self.navigationController?.popViewController(animated: true)
        self.showLoginBottomSheet()
    }
}

// MARK: - MyReceipts
extension ReminderFlowController: MyReceiptsFlowDelegate {
    func goToNewReceipt() {
        
    }
    
    
}
