//
//  ViewController.swift
//  IPhoneSettingTableView
//
//  Created by Олег Стригунов on 17.01.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    //MARK: - Outlets
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(ArrowTableViewCell.self, forCellReuseIdentifier: ArrowTableViewCell.identifier)
        tableView.register(SwitchTableViewCell.self, forCellReuseIdentifier: SwitchTableViewCell.identifier)
        tableView.register(HeaderView.self, forHeaderFooterViewReuseIdentifier: HeaderView.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    let model: [[SettingModel]] = [
        [SettingModel(title: "Авиарежим", image: "airplane", imageColor: .systemOrange, status: .switchOff, message: .no, cellType: .switchCell),
         SettingModel(title: "Wi-Fi", image: "wifi", imageColor: .systemBlue, status: .notConnected, message: .no, cellType: .arrowCell),
         SettingModel(title: "Bluetooth", image: "bluetooth", imageColor: .systemBlue, status: .arrowOn, message: .no, cellType: .arrowCell),
         SettingModel(title: "Сотовая связь", image: "antenna.radiowaves.left.and.right", imageColor: .systemGreen, status: .none, message: .no, cellType: .arrowCell),
         SettingModel(title: "Режим модема", image: "personalhotspot", imageColor: .systemGreen, status: .none, message: .no, cellType: .arrowCell),
         SettingModel(title: "VPN", image: "vpn", imageColor: .systemBlue, status: .switchOff, message: .no, cellType: .switchCell)],
        
        [SettingModel(title: "Уведомления", image: "notification", imageColor: .systemRed, status: .none, message: .no, cellType: .arrowCell),
         SettingModel(title: "Звуки, тактильные сигналы", image: "speaker.wave.3.fill", imageColor: .systemRed, status: .none, message: .no, cellType: .arrowCell),
         SettingModel(title: "Не беспокоить", image: "moon.fill", imageColor: .systemIndigo, status: .none, message: .no, cellType: .arrowCell),
         SettingModel(title: "Экранное время", image: "hourglass", imageColor: .systemIndigo, status: .none, message: .no, cellType: .arrowCell)],
        
        [SettingModel(title: "Основное", image: "gear", imageColor: .systemGray, status: .none, message: .one, cellType: .arrowCell),
         SettingModel(title: "Пункт управления", image: "switch.2", imageColor: .systemGray, status: .none, message: .no, cellType: .arrowCell),
         SettingModel(title: "Экран и яркость", image: "textformat.size", imageColor: .systemBlue, status: .none, message: .no, cellType: .arrowCell),
         SettingModel(title: "Экран \"Домой\"", image: "display_home", imageColor: .systemBlue, status: .none, message: .no, cellType: .arrowCell),
         SettingModel(title: "Универсальный доступ", image: "person.circle", imageColor: .systemBlue, status: .none, message: .no, cellType: .arrowCell),]
    ]
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Настройки"
        
        setupHierarchy()
        setupLayout()
    }
    
    
    //MARK: - Setup
    
    private func setupHierarchy() {
        view.addSubview(tableView)
    }
    
    private func setupLayout() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.bottom.right.equalTo(view)
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 50
        } else {
            return 10
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderView") as! HeaderView
            headerView.label.text = "Настройки"
            return headerView
        }
        return nil
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let info = model[indexPath.section][indexPath.row]
        
        switch info.cellType {
        case .switchCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: SwitchTableViewCell.identifier, for: indexPath) as? SwitchTableViewCell
            cell?.model = info
            return cell  ?? UITableViewCell()
        case .arrowCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: ArrowTableViewCell.identifier, for: indexPath) as? ArrowTableViewCell
            cell?.model = info
            return cell  ?? UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(model[indexPath.section][indexPath.row].title)
    }
}
