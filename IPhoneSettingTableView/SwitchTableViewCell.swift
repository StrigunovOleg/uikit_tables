//
//  SwitchTableViewCell.swift
//  IPhoneSettingTableView
//
//  Created by Олег Стригунов on 22.01.2023.
//

import UIKit

class SwitchTableViewCell: UITableViewCell {
    
    static let identifier = "SwitchTableViewCell"
    
    var model: SettingModel? {
        didSet {
            title.text = model?.title
            if let systemName = UIImage(systemName: model?.image ?? ""), systemName.isSymbolImage {
                image.image = UIImage(systemName: model?.image ?? "")
            } else {
                image.image = UIImage(named: model?.image ?? "")
            }
            wrapper.backgroundColor = UIColor(named: model?.imageColor ?? "")
            image.tintColor = .white
        }
    }
    
    
    //MARK: - Outlets
    
    private let title: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    private let image: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    private let wrapper: UIView = {
        let mainView = UIView()
        mainView.layer.cornerRadius = 6
        return mainView
    }()
    
    
    //MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupHierarchy()
        setupLayout()
        accessoryView = UISwitch()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Setups
    
    private func setupHierarchy() {
        addSubview(title)
        addSubview(wrapper)
        wrapper.addSubview(image)
    }
    
    private func setupLayout() {
        wrapper.snp.makeConstraints { make in
            make.left.equalTo(self.snp.left).offset(20)
            make.centerY.equalTo(self.snp.centerY)
            make.height.equalTo(28)
            make.width.equalTo(28)
        }
        
        image.snp.makeConstraints { make in
            make.centerY.equalTo(wrapper.snp.centerY)
            make.centerX.equalTo(wrapper.snp.centerX)
            make.height.equalTo(22)
            make.width.equalTo(22)
        }
        
        
        title.snp.makeConstraints { make in
            make.left.equalTo(wrapper.snp.right).offset(5)
            make.centerY.equalTo(self.snp.centerY)
        }
    }
}
