//
//  MyReceiptsViewModel.swift
//  Reminder
//
//  Created by Bruna Porato on 07/01/26.
//

import Foundation

class MyReceiptsViewModel {
    func fetchData() -> [Medicine] {
        return DBHelper.shared.fetchReceipts()
    }
}
