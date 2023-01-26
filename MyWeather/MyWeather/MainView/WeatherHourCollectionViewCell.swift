//
//  WeatherHourCollectionViewCell.swift
//  MyWeather
//
//  Created by Developer on 20.01.2023.
//

import UIKit

class WeatherHourCollectionViewCell: UICollectionViewCell {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.borderColor = UIColor.systemBlue.cgColor
        view.layer.shadowRadius = 4
        view.layer.shadowOpacity = 1
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        return view
    }()
    
    lazy var hour: UILabel = {
        let hour = UILabel()
        hour.font = UIFont.systemFont(ofSize: 11)
        return hour
    }()
    
    lazy var weatherImage: UIImageView = {
        let weatherImage = UIImageView()
        return weatherImage
    }()
    
    lazy var weatherDegree: UILabel = {
        let weatherDegree = UILabel()
        weatherDegree.font = UIFont.systemFont(ofSize: 15)
        return weatherDegree
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        contentView.addSubview(containerView)
        [hour, weatherImage, weatherDegree].forEach {
            containerView.addSubview($0)
        }
        
        containerView.snp.makeConstraints {
            $0.left.equalToSuperview().offset(22)
            $0.right.equalToSuperview().offset(22)
            $0.height.equalTo(90)
            $0.width.equalTo(52)
            $0.top.bottom.equalToSuperview()
        }
        
        hour.snp.makeConstraints { (make) in
            make.top.equalTo(15)
            make.centerX.equalToSuperview()
        }
        
        weatherImage.snp.makeConstraints { (make) in
            make.top.equalTo(hour.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
//            make.left.equalTo(13)
//            make.right.equalTo(-13)
        }
        
        weatherDegree.snp.makeConstraints { (make) in
            make.top.equalTo(weatherImage.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
        }
    }
    
    
}
