//
//  LoginBottomSheetViewDelegate.swift
//  Reminder
//
//  Created by Bruna Porato on 30/10/25.
//

import Foundation
import UIKit

protocol LoginBottomSheetViewDelegate: AnyObject {
    func sendLoginData(email: String, password: String)
}
