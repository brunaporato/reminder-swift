//
//  Checkbox.swift
//  Reminder
//
//  Created by Bruna Porato on 24/11/25.
//

import Foundation
import UIKit

class Checkbox: UIView {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Typography.input
        label.textColor = Colors.gray100
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let checkBox: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "square"), for: .normal)
        button.tintColor = Colors.gray400
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    init(label: String) {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = label
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(checkBox)
        addSubview(titleLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            checkBox.leadingAnchor.constraint(equalTo: leadingAnchor),
            checkBox.heightAnchor.constraint(equalToConstant: 24),
            checkBox.widthAnchor.constraint(equalToConstant: 24),
            checkBox.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            titleLabel.leadingAnchor.constraint(equalTo: checkBox.trailingAnchor, constant: Metrics.small),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: checkBox.centerYAnchor)
        ])
    }
    
    
}
