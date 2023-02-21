//
//  ViewController.swift
//  IPhoneSettingTableView
//
//  Created by Олег Стригунов on 17.01.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private var appView: AppView? {
        guard isViewLoaded else { return nil }
        return view as? AppView
    }
    
    var model: AppModel?
    
    func configurationView() {
        guard let models = model?.createModels() else { return }
        appView?.model = models
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Настройки"
        view = AppView()
        model = AppModel()
        configurationView()
    }
}
