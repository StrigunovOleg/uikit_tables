//
//  AppModel.swift
//  IPhoneSettingTableView
//
//  Created by Олег Стригунов on 21.02.2023.
//

import Foundation

final class AppModel {
    
    func createModels() -> [[SettingModel]] {
        return [
            [SettingModel(title: "Авиарежим", image: "airplane", imageColor: "c_orange", status: .switchOff, message: .no, cellType: .switchCell),
             SettingModel(title: "Wi-Fi", image: "wifi", imageColor: "c_blue", status: .notConnected, message: .no, cellType: .arrowCell),
             SettingModel(title: "Bluetooth", image: "bluetooth", imageColor: "c_blue", status: .arrowOn, message: .no, cellType: .arrowCell),
             SettingModel(title: "Сотовая связь", image: "antenna.radiowaves.left.and.right", imageColor: "c_green", status: .none, message: .no, cellType: .arrowCell),
             SettingModel(title: "Режим модема", image: "personalhotspot", imageColor: "c_green", status: .none, message: .no, cellType: .arrowCell),
             SettingModel(title: "VPN", image: "vpn", imageColor: "c_blue", status: .switchOff, message: .no, cellType: .switchCell)],
            
            [SettingModel(title: "Уведомления", image: "notification", imageColor: "c_red", status: .none, message: .no, cellType: .arrowCell),
             SettingModel(title: "Звуки, тактильные сигналы", image: "speaker.wave.3.fill", imageColor: "c_red", status: .none, message: .no, cellType: .arrowCell),
             SettingModel(title: "Не беспокоить", image: "moon.fill", imageColor: "c_grape", status: .none, message: .no, cellType: .arrowCell),
             SettingModel(title: "Экранное время", image: "hourglass", imageColor: "c_grape", status: .none, message: .no, cellType: .arrowCell)],
            
            [SettingModel(title: "Основное", image: "gear", imageColor: "c_gray", status: .none, message: .one, cellType: .arrowCell),
             SettingModel(title: "Пункт управления", image: "switch.2", imageColor: "c_gray", status: .none, message: .no, cellType: .arrowCell),
             SettingModel(title: "Экран и яркость", image: "textformat.size", imageColor: "c_blue", status: .none, message: .no, cellType: .arrowCell),
             SettingModel(title: "Экран \"Домой\"", image: "display_home", imageColor: "c_blue", status: .none, message: .no, cellType: .arrowCell),
             SettingModel(title: "Универсальный доступ", image: "person.circle", imageColor: "c_blue", status: .none, message: .no, cellType: .arrowCell)]
        ]
    }
}
