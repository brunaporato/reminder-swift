//
//  LoginBottomSheetViewModel.swift
//  Reminder
//
//  Created by Bruna Porato on 31/10/25.
//

import Foundation
import Firebase

class LoginBottomSheetViewModel {
    var successResult: ((String) -> Void)?
    var errorResult: ((String) -> Void)?
    
    func doAuth(usernameLogin: String, password: String) {
        Auth.auth().signIn(withEmail: usernameLogin, password: password) { [weak self] authResult, error in
            if error != nil {
                self?.errorResult?("Erro ao realizar login, verifique as credenciais digitadas.")
            } else {
                self?.successResult?(usernameLogin)
            }
        }
    }
}
