//
//  AllDaysCollectionViewCell.swift
//  MyWeather
//
//  Created by Developer on 26.01.2023.
//

import UIKit
import SnapKit

class AllDaysCollectionViewCell: UICollectionViewCell {
    
    lazy var weekDayLabel: UILabel = {
        let weekDayLabel = UILabel()
        weekDayLabel.font = UIFont.systemFont(ofSize: 18)
        return weekDayLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupView()
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        addSubview(weekDayLabel)
        
        
        weekDayLabel.snp.makeConstraints { (make) in
            make.top.left.right.bottom.equalToSuperview()
        }
    }

}
