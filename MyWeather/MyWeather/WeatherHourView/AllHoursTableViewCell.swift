//
//  AllDaysTableViewCell.swift
//  MyWeather
//
//  Created by Developer on 25.01.2023.
//

import UIKit
import SnapKit

class AllHoursTableViewCell: UITableViewCell {

    lazy var weekDayLabel: UILabel = {
        let weekDayLabel = UILabel()
        weekDayLabel.font = UIFont.systemFont(ofSize: 16)
        weekDayLabel.textColor = .black
        return weekDayLabel
    }()
    
    lazy var hourLabel: UILabel = {
        let hourLabel = UILabel()
        hourLabel.font = UIFont.systemFont(ofSize: 14)
        hourLabel.textColor = UIColor(hexString: "#9A9696")
        return hourLabel
    }()
    
    lazy var temperatureLabel: UILabel = {
        let temperatureLabel = UILabel()
        temperatureLabel.textColor = .black
        temperatureLabel.font = UIFont.boldSystemFont(ofSize: 18)
        return temperatureLabel
    }()
    
    lazy var feelsLikeImageView: UIImageView = {
        let feelsLikeImageView = UIImageView()
        feelsLikeImageView.image = UIImage(named: "allHoursFeel")
        return feelsLikeImageView
    }()
    
    lazy var feelsLikeLabel: UILabel = {
        let feelsLikeLabel = UILabel()
        feelsLikeLabel.font = UIFont.systemFont(ofSize: 14)
        feelsLikeLabel.text = "Преимуществен.. По ощущению"
        return feelsLikeLabel
    }()
    
    lazy var feelsLikeResultLabel: UILabel = {
        let feelsLikeLabel = UILabel()
        feelsLikeLabel.font = UIFont.systemFont(ofSize: 14)
        feelsLikeLabel.textColor = UIColor(hexString: "#9A9696")
        return feelsLikeLabel
    }()
    
    lazy var windImageView: UIImageView = {
        let windImageView = UIImageView()
        windImageView.image = UIImage(named: "allHoursWind")
        return windImageView
    }()
    
    lazy var windSpeedLabel: UILabel = {
        let windSpeedLabel = UILabel()
        windSpeedLabel.text = "Скорость ветра"
        windSpeedLabel.font = UIFont.systemFont(ofSize: 14)
        return windSpeedLabel
    }()
    
    lazy var windSpeedResultLabel: UILabel = {
        let windSpeedLabel = UILabel()
        windSpeedLabel.font = UIFont.systemFont(ofSize: 14)
        windSpeedLabel.textColor = UIColor(hexString: "#9A9696")
        return windSpeedLabel
    }()
    
    lazy var humidityImageView: UIImageView = {
        let humidityImageView = UIImageView()
        humidityImageView.image = UIImage(named: "allHoursHumidity")
        return humidityImageView
    }()
    
    lazy var humidityLabel: UILabel = {
        let humidityLabel = UILabel()
        humidityLabel.font = UIFont.systemFont(ofSize: 14)
        humidityLabel.text = "Влажность"
        return humidityLabel
    }()
    
    lazy var humidityResultLabel: UILabel = {
        let humidityLabel = UILabel()
        humidityLabel.font = UIFont.systemFont(ofSize: 14)
        humidityLabel.textColor = UIColor(hexString: "#9A9696")
        return humidityLabel
    }()
    
    lazy var cloudImageView: UIImageView = {
        let cloudImageView = UIImageView()
        cloudImageView.image = UIImage(named: "allHoursCloud")
        return cloudImageView
    }()
    
    lazy var cloudLabel: UILabel = {
        let cloudLabel = UILabel()
        cloudLabel.font = UIFont.systemFont(ofSize: 14)
        cloudLabel.text = "Облачность"
        return cloudLabel
    }()
    
    lazy var cloudResultLabel: UILabel = {
        let cloudLabel = UILabel()
        cloudLabel.font = UIFont.systemFont(ofSize: 14)
        cloudLabel.textColor = UIColor(hexString: "#9A9696")
        return cloudLabel
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    private func setupView() {
        
        addSubview(weekDayLabel)
        addSubview(hourLabel)
        addSubview(temperatureLabel)
        addSubview(feelsLikeImageView)
        addSubview(windImageView)
        addSubview(humidityImageView)
        addSubview(cloudImageView)
        addSubview(feelsLikeLabel)
        addSubview(feelsLikeResultLabel)
        addSubview(windSpeedResultLabel)
        addSubview(humidityResultLabel)
        addSubview(cloudResultLabel)
        addSubview(windSpeedLabel)
        addSubview(humidityLabel)
        addSubview(cloudLabel)
        
        
        weekDayLabel.snp.makeConstraints { (make) in
            make.top.equalTo(15)
            make.left.equalTo(16)
        }
        
        hourLabel.snp.makeConstraints { (make) in
            make.top.equalTo(weekDayLabel.snp.bottom).offset(8)
            make.left.equalTo(16)
        }
        
        temperatureLabel.snp.makeConstraints { (make) in
            make.top.equalTo(hourLabel.snp.bottom).offset(10)
            make.left.equalTo(16)
        }
        
        feelsLikeImageView.snp.makeConstraints { (make) in
            make.left.equalTo(hourLabel.snp.right).offset(12)
            make.top.equalTo(weekDayLabel.snp.bottom).offset(8)
        }
        
        windImageView.snp.makeConstraints { (make) in
            make.top.equalTo(feelsLikeImageView.snp.bottom).offset(23)
            make.left.equalTo(hourLabel.snp.right).offset(12)
        }
        
        humidityImageView.snp.makeConstraints { (make) in
            make.top.equalTo(windImageView.snp.bottom).offset(23)
            make.left.equalTo(hourLabel.snp.right).offset(12)
        }
        
        cloudImageView.snp.makeConstraints { (make) in
            make.top.equalTo(humidityImageView.snp.bottom).offset(23)
            make.left.equalTo(hourLabel.snp.right).offset(12)
        }
        
        feelsLikeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(weekDayLabel.snp.bottom).offset(8)
            make.left.equalTo(feelsLikeImageView.snp.right).offset(5)
        }
        
        feelsLikeResultLabel.snp.makeConstraints { (make) in
            make.top.equalTo(weekDayLabel.snp.bottom).offset(8)
            make.right.equalTo(-15)
        }
        
        windSpeedLabel.snp.makeConstraints { (make) in
            make.top.equalTo(feelsLikeLabel.snp.bottom).offset(23)
            make.left.equalTo(windImageView.snp.right).offset(5)
        }
        
        windSpeedResultLabel.snp.makeConstraints { (make) in
            make.top.equalTo(feelsLikeImageView.snp.bottom).offset(23)
            make.right.equalTo(-15)
        }
        
        humidityLabel.snp.makeConstraints { (make) in
            make.top.equalTo(windSpeedLabel.snp.bottom).offset(23)
            make.left.equalTo(humidityImageView.snp.right).offset(5)
        }
        
        humidityResultLabel.snp.makeConstraints { (make) in
            make.top.equalTo(windSpeedResultLabel.snp.bottom).offset(23)
            make.right.equalTo(-15)
        }
        
        cloudLabel.snp.makeConstraints { (make) in
            make.top.equalTo(humidityLabel.snp.bottom).offset(23)
            make.left.equalTo(cloudImageView.snp.right).offset(5)
        }
        
        cloudResultLabel.snp.makeConstraints { (make) in
            make.top.equalTo(humidityResultLabel.snp.bottom).offset(23)
            make.right.equalTo(-15)
        }
    }
}
