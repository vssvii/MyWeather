//
//  AllDaysTableViewCell.swift
//  MyWeather
//
//  Created by Developer on 26.01.2023.
//

import UIKit

class AllDaysTableViewCell: UITableViewCell {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hexString: "#E9EEFA")
        view.layer.cornerRadius = 3
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 4
        view.layer.shadowOpacity = 1
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        return view
    }()
    
    lazy var dayType: UILabel = {
        let dayType = UILabel()
        return dayType
    }()
    
    lazy var weatherImageView: UIImageView = {
        let weatherImageView = UIImageView()
        return weatherImageView
    }()
    
    lazy var temp: UILabel = {
        let temp = UILabel()
        return temp
    }()
    
    lazy var feelsLikeImage: UIImageView = {
        let feelsLikeImage = UIImageView()
        return feelsLikeImage
    }()
    
    lazy var feelsLikeLabel: UILabel = {
        let feelsLikeLabel = UILabel()
        return feelsLikeLabel
    }()
    
    lazy var feelsLikeResultLabel: UILabel = {
        let feelsLikeResultLabel = UILabel()
        return feelsLikeResultLabel
    }()
    
    lazy var windSpeedImage: UIImageView = {
        let windSpeedImage = UIImageView()
        return windSpeedImage
    }()
    
    lazy var windSpeedLabel: UILabel = {
        let windSpeedLabel = UILabel()
        return windSpeedLabel
    }()
    
    lazy var windSpeedResultLabel: UILabel = {
        let windSpeedResultLabel = UILabel()
        return windSpeedResultLabel
    }()
    
    lazy var uvIndexImage: UIImageView = {
        let uvIndexImage = UIImageView()
        return uvIndexImage
    }()
    
    lazy var uvIndexLabel: UILabel = {
        let uvIndexLabel = UILabel()
        return uvIndexLabel
    }()
    
    lazy var uvIndexResultLabel: UILabel = {
        let uvIndexResultLabel = UILabel()
        return uvIndexResultLabel
    }()
    
    lazy var rainImage: UIImageView = {
        let rainImage = UIImageView()
        return rainImage
    }()
    
    lazy var rainLabel: UILabel = {
        let rainLabel = UILabel()
        return rainLabel
    }()
    
    lazy var rainResultLabel: UILabel = {
        let rainResultLabel = UILabel()
        return rainResultLabel
    }()
    
    lazy var cloudnessImage: UIImageView = {
        let rainImage = UIImageView()
        return rainImage
    }()
    
    lazy var cloudnessLabel: UILabel = {
        let rainLabel = UILabel()
        return rainLabel
    }()
    
    lazy var cloudnessResultLabel: UILabel = {
        let rainResultLabel = UILabel()
        return rainResultLabel
    }()
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        setupView()
        
    }
    
    private func setupView() {
        
        self.backgroundColor = .white
        
        contentView.addSubview(containerView)
        [dayType, weatherImageView, temp, feelsLikeImage, feelsLikeLabel, feelsLikeResultLabel, windSpeedImage, windSpeedLabel, windSpeedResultLabel, uvIndexImage, uvIndexLabel, uvIndexResultLabel, rainImage, rainLabel, rainResultLabel, cloudnessImage, cloudnessLabel, cloudnessResultLabel ].forEach {
            containerView.addSubview($0)
        }
        
        containerView.snp.makeConstraints {
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
            $0.height.equalTo(70)
            $0.top.bottom.equalToSuperview().inset(4)
        }
        
        dayType.snp.makeConstraints { (make) in
            make.top.equalTo(21)
            make.left.equalTo(15)
        }
        
        weatherImageView.snp.makeConstraints { (make) in
            make.top.equalTo(15)
            make.centerX.equalToSuperview()
        }
        
        temp.snp.makeConstraints { (make) in
            make.top.equalTo(15)
            make.left.equalTo(weatherImageView.snp.right).offset(10)
        }
        
        feelsLikeImage.snp.makeConstraints { (make) in
            make.top.equalTo(dayType.snp.bottom).offset(66)
            make.left.equalTo(16)
        }
        
        feelsLikeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(dayType.snp.bottom).offset(66)
            make.left.equalTo(feelsLikeImage.snp.right).offset(18)
        }
        
        feelsLikeResultLabel.snp.makeConstraints { (make) in
            make.top.equalTo(dayType.snp.bottom).offset(66)
            make.right.equalTo(-16)
        }
        
        windSpeedImage.snp.makeConstraints { (make) in
            make.top.equalTo(feelsLikeImage.snp.bottom).offset(30)
            make.left.equalTo(15)
        }
        
        windSpeedLabel.snp.makeConstraints { (make) in
            make.top.equalTo(feelsLikeImage.snp.bottom).offset(30)
            make.left.equalTo(windSpeedImage.snp.right).offset(18)
        }
        
        windSpeedResultLabel.snp.makeConstraints { (make) in
            make.top.equalTo(feelsLikeImage.snp.bottom).offset(30)
            make.right.equalTo(-16)
        }
        
        uvIndexImage.snp.makeConstraints { (make) in
            make.top.equalTo(windSpeedImage.snp.bottom).offset(30)
            make.left.equalTo(15)
        }
        
        uvIndexLabel.snp.makeConstraints { (make) in
            make.top.equalTo(windSpeedImage.snp.bottom).offset(30)
            make.left.equalTo(uvIndexImage.snp.right).offset(18)
        }
        
        uvIndexResultLabel.snp.makeConstraints { (make) in
            make.top.equalTo(windSpeedImage.snp.bottom).offset(30)
            make.right.equalTo(-16)
        }
        
        rainImage.snp.makeConstraints { (make) in
            make.top.equalTo(uvIndexImage.snp.bottom).offset(30)
            make.left.equalTo(15)
        }
        
        rainLabel.snp.makeConstraints { (make) in
            make.top.equalTo(uvIndexImage.snp.bottom).offset(30)
            make.left.equalTo(rainImage.snp.right).offset(18)
        }
        
        rainResultLabel.snp.makeConstraints { (make) in
            make.top.equalTo(uvIndexImage.snp.bottom).offset(30)
            make.right.equalTo(-16)
        }
        
        cloudnessImage.snp.makeConstraints { (make) in
            make.top.equalTo(rainImage.snp.bottom).offset(30)
            make.left.equalTo(15)
        }
        
        cloudnessLabel.snp.makeConstraints { (make) in
            make.top.equalTo(rainImage.snp.bottom).offset(30)
            make.left.equalTo(cloudnessLabel.snp.right).offset(18)
        }
        
        cloudnessResultLabel.snp.makeConstraints { (make) in
            make.top.equalTo(rainImage.snp.bottom).offset(30)
            make.right.equalTo(-16)
        }
    }
}
