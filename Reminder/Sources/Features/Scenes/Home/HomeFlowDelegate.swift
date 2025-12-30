//
//  HomeFlowDelegate.swift
//  Reminder
//
//  Created by Bruna Porato on 15/11/25.
//

import Foundation

public protocol HomeFlowDelegate: AnyObject {
    func navigateToNewReceipts()
    func navigateToMyReceipts()
    func logOut()
}
