//
//  Cell.swift
//  RickAndMorty
//
//  Created by Нина  on 11.10.2024.
//
import SnapKit
import UIKit

class Cell: UITableViewCell {
    let cell = "Cell"
    var name = UILabel()
    var image = UIImageView()
    var gender = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor.black
        
        contentView.addSubview(name)
        contentView.addSubview(image)
        contentView.addSubview(gender)
        
        name.textColor = .yellow
        name.font = UIFont.boldSystemFont(ofSize: 26)
        
        gender.textColor = .white
        gender.font = UIFont.boldSystemFont(ofSize: 20)
        
        image.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview().inset(10)
            make.width.equalTo(100)
        }
        
        name.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(image.snp.trailing).offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }
        
        gender.snp.makeConstraints { make in
            make.top.equalTo(name).offset(32)
            make.leading.trailing.equalTo(name)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
