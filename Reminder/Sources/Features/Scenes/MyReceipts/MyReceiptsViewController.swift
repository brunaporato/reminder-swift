//
//  MyReceiptsViewController.swift
//  Reminder
//
//  Created by Bruna Porato on 30/12/25.
//

import Foundation
import UIKit

class MyReceiptsViewController: UIViewController {
    let contentView: MyReceiptsView
    weak var flowDelegate: MyReceiptsFlowDelegate?
    
    private let mockMedicines = [
        ("Buscopam", "13:00", "2 em 2 horas"),
        ("Aspirina", "09:00", "8 em 8 horas"),
        ("Swift", "14:00", "2 em 2 horas"),
        ("Buscopam", "13:00", "2 em 2 horas"),
        ("Buscopam", "13:00", "2 em 2 horas"),
        ("Buscopam", "13:00", "2 em 2 horas"),
        ("Buscopam", "13:00", "2 em 2 horas"),
        ("Buscopam", "13:00", "2 em 2 horas"),
        ("Buscopam", "13:00", "2 em 2 horas"),
        ("Buscopam", "13:00", "2 em 2 horas"),
        ("Buscopam", "13:00", "2 em 2 horas"),
        
    ]
    
    init(contentView: MyReceiptsView, flowDelegate: MyReceiptsFlowDelegate) {
        self.contentView = contentView
        self.flowDelegate = flowDelegate
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupTableView()
    }
    
    private func setup() {
        view.addSubview(contentView)
        view.backgroundColor = Colors.gray800

        setupConstraints()
    }
    
    private func setupConstraints() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
                
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupTableView() {
        contentView.tableView.dataSource = self
        contentView.tableView.delegate = self
        contentView.tableView.register(MedicineCell.self, forCellReuseIdentifier: MedicineCell.identifier)
        contentView.tableView.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
    }
}

extension MyReceiptsViewController: UITableViewDelegate, UITableViewDataSource {
    // DELEGATE
    func numberOfSections(in tableView: UITableView) -> Int {
        return mockMedicines.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 4
    }
    
    // DATASOURCE
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MedicineCell.identifier, for: indexPath) as! MedicineCell
        let medicine = mockMedicines[indexPath.section]
        cell.configure(title: medicine.0, time: medicine.1, recurrency: medicine.2)
        return cell
    }
    
    
}
