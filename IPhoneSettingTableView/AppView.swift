//
//  View.swift
//  IPhoneSettingTableView
//
//  Created by Олег Стригунов on 20.02.2023.
//



import UIKit
import SnapKit

class AppView: UIView {
    
    var model: [[SettingModel]]?
    
    //MARK: - Outlets
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(ArrowTableViewCell.self, forCellReuseIdentifier: ArrowTableViewCell.identifier)
        tableView.register(SwitchTableViewCell.self, forCellReuseIdentifier: SwitchTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    //MARK: - Init
    init() {
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .white
        setupHierarchy()
        setupLayout()
    }
    
    //MARK: - Setup
    private func setupHierarchy() {
        addSubview(tableView)
    }
    
    private func setupLayout() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.left.bottom.right.equalTo(self)
        }
    }
}


extension AppView: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return model?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model?[section].count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let info = model?[indexPath.section][indexPath.row]
        
        switch info?.cellType {
        case .switchCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: SwitchTableViewCell.identifier, for: indexPath) as? SwitchTableViewCell
            cell?.model = info
            return cell  ?? UITableViewCell()
        case .arrowCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: ArrowTableViewCell.identifier, for: indexPath) as? ArrowTableViewCell
            cell?.model = info
            return cell  ?? UITableViewCell()
        case .none:
             return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(model?[indexPath.section][indexPath.row].title as Any)
    }
}
