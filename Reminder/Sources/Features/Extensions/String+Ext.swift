//
//  String+Ext.swift
//  Reminder
//
//  Created by Bruna Porato on 30/10/25.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
