//
//  MedicineCell.swift
//  Reminder
//
//  Created by Bruna Porato on 31/12/25.
//

import Foundation
import UIKit

class MedicineCell: UITableViewCell {
    static let identifier = "MedicineCell"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Typography.subHeading
        label.textColor = Colors.gray200
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let timeBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.gray500
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.font = Typography.tag
        label.textColor = Colors.gray100
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let recurrencyBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.gray500
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let recurrencyLabel: UILabel = {
        let label = UILabel()
        label.font = Typography.tag
        label.textColor = Colors.gray100
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let watchIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "clock"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let recurrencyIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "recurrency"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let trashButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "trash")
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.backgroundColor = Colors.gray700
        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = 12
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(timeBackgroundView)
        contentView.addSubview(recurrencyBackgroundView)
        contentView.addSubview(trashButton)
        
        timeBackgroundView.addSubview(watchIcon)
        timeBackgroundView.addSubview(timeLabel)
        
        recurrencyBackgroundView.addSubview(recurrencyIcon)
        recurrencyBackgroundView.addSubview(recurrencyLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Metrics.medier),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Metrics.medier),
            
//            timeBackgroundView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.small),
            timeBackgroundView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Metrics.small),
            timeBackgroundView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            timeBackgroundView.heightAnchor.constraint(equalToConstant: 28),
            
            watchIcon.leadingAnchor.constraint(equalTo: timeBackgroundView.leadingAnchor, constant: Metrics.tiny),
            watchIcon.centerYAnchor.constraint(equalTo: timeBackgroundView.centerYAnchor),
            watchIcon.widthAnchor.constraint(equalToConstant: 14),
            watchIcon.heightAnchor.constraint(equalToConstant: 14),
            
            timeLabel.centerYAnchor.constraint(equalTo: timeBackgroundView.centerYAnchor),
            timeLabel.leadingAnchor.constraint(equalTo: watchIcon.trailingAnchor, constant: Metrics.tiny),
            timeLabel.trailingAnchor.constraint(equalTo: timeBackgroundView.trailingAnchor, constant: -Metrics.small),
            
            recurrencyBackgroundView.centerYAnchor.constraint(equalTo: timeBackgroundView.centerYAnchor),
//            recurrencyBackgroundView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.small),
            recurrencyBackgroundView.leadingAnchor.constraint(equalTo: timeBackgroundView.trailingAnchor, constant: Metrics.small),
            recurrencyBackgroundView.heightAnchor.constraint(equalToConstant: 28),
            
            recurrencyIcon.centerYAnchor.constraint(equalTo: recurrencyBackgroundView.centerYAnchor),
            recurrencyIcon.leadingAnchor.constraint(equalTo: recurrencyBackgroundView.leadingAnchor, constant: Metrics.tiny),
            recurrencyIcon.widthAnchor.constraint(equalToConstant: 14),
            recurrencyIcon.heightAnchor.constraint(equalToConstant: 14),
            
            recurrencyLabel.centerYAnchor.constraint(equalTo: recurrencyBackgroundView.centerYAnchor),
            recurrencyLabel.leadingAnchor.constraint(equalTo: recurrencyIcon.trailingAnchor, constant: Metrics.tiny),
            recurrencyLabel.trailingAnchor.constraint(equalTo: recurrencyBackgroundView.trailingAnchor, constant: -Metrics.small),
            
//            trashButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Metrics.medier),
            trashButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Metrics.medier),
            trashButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            trashButton.widthAnchor.constraint(equalToConstant: 16),
            trashButton.heightAnchor.constraint(equalToConstant: 16),
            
            contentView.bottomAnchor.constraint(equalTo: timeBackgroundView.bottomAnchor, constant: Metrics.medium)
        ])
    }
    
    func configure(title: String, time: String, recurrency: String) {
        titleLabel.text = title
        timeLabel.text = time
        recurrencyLabel.text = recurrency
    }
}
