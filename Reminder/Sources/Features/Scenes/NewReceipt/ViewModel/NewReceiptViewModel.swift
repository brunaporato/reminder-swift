//
//  NewReceiptViewModel.swift
//  Reminder
//
//  Created by Bruna Porato on 11/12/25.
//

import Foundation

class NewReceiptViewModel {
    func addReceipt(medicine: String, time: String, recurrency: String, takenNow: Bool) {
        DBHelper.shared.insertReceipt(medicine: medicine, time: time, recurrency: recurrency, takenNow: takenNow)
    }
}
