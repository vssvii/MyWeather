//
//  WeatherWeekTableViewCell.swift
//  MyWeather
//
//  Created by Developer on 15.01.2023.
//

import UIKit
import SnapKit

class WeatherWeekTableViewCell: UITableViewCell {
    
    
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hexString: "#E9EEFA")
        view.layer.cornerRadius = 10
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 4
        view.layer.shadowOpacity = 1
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        return view
    }()

    lazy var weatherWeekDate: UILabel = {
        let weatherDate = UILabel()
        weatherDate.font = UIFont.systemFont(ofSize: 16)
        weatherDate.textColor = UIColor(hexString: "#9A9696")
        return weatherDate
    }()
    
    lazy var weatherWeekImage: UIImageView = {
        let weatherWeekImage = UIImageView()
        return weatherWeekImage
    }()
    
    lazy var airHumidity: UILabel = {
        let airHumidity = UILabel()
        airHumidity.textColor = UIColor(hexString: "#204EC7")
        return airHumidity
    }()
    
    lazy var descriptionWeatherWeek: UILabel = {
        let descriptionWeatherWeek = UILabel()
        descriptionWeatherWeek.font = UIFont.systemFont(ofSize: 16)
        descriptionWeatherWeek.numberOfLines = 0
        descriptionWeatherWeek.lineBreakMode = .byWordWrapping
        descriptionWeatherWeek.sizeToFit()
        return descriptionWeatherWeek
    }()
    
    lazy var weatherWeekDegree: UILabel = {
        let weatherWeekDegree = UILabel()
        weatherWeekDegree.font = UIFont.boldSystemFont(ofSize: 18)
        return weatherWeekDegree
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        
        contentView.addSubview(containerView)
        [weatherWeekDate, weatherWeekImage, airHumidity, descriptionWeatherWeek, weatherWeekDegree].forEach {
            containerView.addSubview($0)
        }
        
        containerView.snp.makeConstraints {
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
            $0.height.equalTo(70)
            $0.top.bottom.equalToSuperview().inset(4)
        }
        
        weatherWeekDate.snp.makeConstraints { (make) in
            make.top.equalTo(6)
            make.left.equalTo(10)
        }
        
        weatherWeekImage.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.top.equalTo(weatherWeekDate.snp.bottom).offset(10)
        }
        
        airHumidity.snp.makeConstraints { (make) in
            make.left.equalTo(weatherWeekImage.snp.right).offset(6)
            make.top.equalTo(weatherWeekDate.snp.bottom).offset(12)
        }
        
        descriptionWeatherWeek.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(150)
        }
        
        weatherWeekDegree.snp.makeConstraints { (make) in
            make.right.equalTo(-20)
            make.top.equalTo(17)
        }
    }
}
