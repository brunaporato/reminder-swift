//
//  LoginBottomSheetView.swift
//  Reminder
//
//  Created by Bruna Porato on 28/10/25.
//

import Foundation
import UIKit

class LoginBottomSheetView: UIView {
    public weak var delegate: LoginBottomSheetViewDelegate?
    
    private let handleArea: UIView = {
        let view = UIView()
        
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = Metrics.tiny
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let titleLabel: UILabel = {
        let title = UILabel()
        
        title.text = "login.label.title".localized
        title.font = Typography.subHeading
        title.translatesAutoresizingMaskIntoConstraints = false
        
        return title
    }()
    
    private let loginTextFieldLabel: UILabel = {
        let title = UILabel()
        
        title.text = "login.loginTextLabel.title".localized
        title.font = Typography.label
        title.translatesAutoresizingMaskIntoConstraints = false
        
        return title
    }()
    
    private let passwordTextFieldLabel: UILabel = {
        let title = UILabel()
        
        title.text = "login.passwordTextLabel.title".localized
        title.font = Typography.label
        title.translatesAutoresizingMaskIntoConstraints = false
        
        return title
    }()
    
    private let emailTextField: UITextField = {
        let text = UITextField()
        
        text.placeholder = "login.email.placeholder".localized
        text.borderStyle = .roundedRect
        text.translatesAutoresizingMaskIntoConstraints = false
        
        return text
    }()
    
    private let passwordTextField: UITextField = {
        let text = UITextField()
        
        text.placeholder = "login.password.placeholder".localized
        text.borderStyle = .roundedRect
        text.isSecureTextEntry = true
        text.translatesAutoresizingMaskIntoConstraints = false
        
        return text
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("login.button.title".localized, for: .normal)
        button.backgroundColor = Colors.redBase
        button.tintColor = .white
        button.titleLabel?.font = Typography.subHeading
        button.layer.cornerRadius = Metrics.medium
        button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.backgroundColor = .white
        self.layer.cornerRadius = Metrics.small
        
        addSubview(titleLabel)
        addSubview(loginTextFieldLabel)
        addSubview(emailTextField)
        addSubview(passwordTextFieldLabel)
        addSubview(passwordTextField)
        addSubview(loginButton)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: Metrics.huge),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.large),
            
            loginTextFieldLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.large),
            loginTextFieldLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.large),
            
            emailTextField.topAnchor.constraint(equalTo: loginTextFieldLabel.bottomAnchor, constant: Metrics.small),
            emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.large),
            emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.large),
            emailTextField.heightAnchor.constraint(equalToConstant: Metrics.inputSize),
            
            passwordTextFieldLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: Metrics.medium),
            passwordTextFieldLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.large),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordTextFieldLabel.bottomAnchor, constant: Metrics.small),
            passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.large),
            passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.large),
            passwordTextField.heightAnchor.constraint(equalToConstant: Metrics.inputSize),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: Metrics.large),
            loginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.large),
            loginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.large),
            loginButton.heightAnchor.constraint(equalToConstant: Metrics.buttonSize)
        ])
    }
    
    @objc private func loginButtonDidTap() {
        let password = passwordTextField.text ?? ""
        let email = emailTextField.text ?? ""
        
        delegate?.sendLoginData(email: email, password: password)
    }
}
