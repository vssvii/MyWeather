//
//  TodayWeatherView.swift
//  MyWeather
//
//  Created by Developer on 15.12.2022.
//

import UIKit
import SnapKit

class TodayWeatherView: UIView {
    
    let viewModel = WeatherViewModel()
    
    var weatherData: Weather?
    
    
    var updateButton: UIButton = {
        let updateButton = UIButton()
        return updateButton
    }()

    
    var subTemperatureLabel: UILabel = {
        let subTemperatureLabel = UILabel()
        subTemperatureLabel.font = .boldSystemFont(ofSize: 16)
        subTemperatureLabel.textColor = .white
        return subTemperatureLabel
    }()
    
    var temperatureLabel: UILabel = {
        let temperatureLabel = UILabel()
        temperatureLabel.textAlignment = .center
        temperatureLabel.font = .boldSystemFont(ofSize: 36)
        temperatureLabel.textColor = .white
        //        subTemperatureLabel.text =
        return temperatureLabel
    }()
    
    var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.textAlignment = .center
        descriptionLabel.font = .boldSystemFont(ofSize: 16)
        descriptionLabel.textColor = .white
        //        subTemperatureLabel.text =
        return descriptionLabel
    }()
    
    var cloudImageView: UIImageView = {
        let cloudImageView = UIImageView()
        cloudImageView.image = UIImage(named: "cloud")
        return cloudImageView
    }()
    
    var cloudnessLabel: UILabel = {
        let cloudnessLabel = UILabel()
        cloudnessLabel.textColor = .white
        cloudnessLabel.font = UIFont.systemFont(ofSize: 14)
        return cloudnessLabel
    }()
    
    var windSpeedLabel: UILabel = {
        let windSpeed = UILabel()
        windSpeed.textColor = .white
        windSpeed.font = UIFont.systemFont(ofSize: 14)
        return windSpeed
    }()
    
    var humidityLabel: UILabel = {
        let humidityLabel = UILabel()
        humidityLabel.textColor = .white
        humidityLabel.font = UIFont.systemFont(ofSize: 14)
        return humidityLabel
    }()
    
    var windImageView: UIImageView = {
        let windImageView = UIImageView()
        windImageView.image = UIImage(named: "wind")
        return windImageView
    }()
    
    var rainImageView: UIImageView = {
        let rainImageView = UIImageView()
        rainImageView.image = UIImage(named: "rain")
        return rainImageView
    }()
    
    var initialTimeLabel: UILabel = {
        let initialTime = UILabel()
        return initialTime
    }()
    
    var endingTimeLabel: UILabel = {
        let endingTime = UILabel()
        return endingTime
    }()
    
    var presentDateLabel: UILabel = {
        let presentDate = UILabel()
        return presentDate
    }()
    
    var sunriseImageView: UIImageView = {
        let sunriseImageView = UIImageView()
        sunriseImageView.image = UIImage(named: "sunrise")
        return sunriseImageView
    }()
    
    var sunriseHourLabel: UILabel = {
        let sunriseHourLabel = UILabel()
        sunriseHourLabel.textColor = .white
        sunriseHourLabel.font = UIFont.systemFont(ofSize: 14)
        return sunriseHourLabel
    }()
    
    
    var sunsetImageView: UIImageView = {
        let sunsetImageView = UIImageView()
        sunsetImageView.image = UIImage(named: "sunset")
        return sunsetImageView
    }()
    
    var sunsetHourLabel: UILabel = {
        let sunsetHourLabel = UILabel()
        sunsetHourLabel.font = UIFont.systemFont(ofSize: 14)
        sunsetHourLabel.textColor = .white
        return sunsetHourLabel
    }()
    
    var nowDateLabel: UILabel = {
        let nowDateLabel = UILabel()
        nowDateLabel.textColor = .systemYellow
        nowDateLabel.font = UIFont.systemFont(ofSize: 16)
        return nowDateLabel
    }()
    
    
    override func draw(_ rect: CGRect) {
        guard let ctx = UIGraphicsGetCurrentContext() else {
            return
        }
        setSemiCircle()
        setupView()
        getData()
    }
    
    private func setSemiCircle() {
        var lastArcAngle = -CGFloat.pi
        let fullCircle = CGFloat.pi * 2
        let arcAngle = fullCircle * 1/2
        let path = UIBezierPath(arcCenter: CGPoint(x: bounds.size.width / 2, y: bounds.size.height - 50), radius: 150, startAngle: lastArcAngle, endAngle: lastArcAngle + arcAngle, clockwise: true)
        UIColor.systemYellow.setStroke()
        path.lineWidth = 5
        path.stroke()
        lastArcAngle += arcAngle
        
        TodayWeatherView.appearance().backgroundColor = UIColor(hexString: "#204EC7")

    }
    
    private func setupView() {
        addSubview(subTemperatureLabel)
        addSubview(temperatureLabel)
        addSubview(descriptionLabel)
        addSubview(cloudImageView)
        addSubview(windImageView)
        addSubview(rainImageView)
        addSubview(initialTimeLabel)
        addSubview(endingTimeLabel)
        addSubview(presentDateLabel)
        addSubview(sunriseImageView)
        addSubview(sunsetImageView)
        addSubview(sunriseHourLabel)
        addSubview(sunsetHourLabel)
        addSubview(cloudnessLabel)
        addSubview(windSpeedLabel)
        addSubview(humidityLabel)
        addSubview(nowDateLabel)
        
        subTemperatureLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(43)
        }
        
        temperatureLabel.snp.makeConstraints { (make) in
            make.top.equalTo(subTemperatureLabel.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(temperatureLabel.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
        }
        
        sunriseImageView.snp.makeConstraints { (make) in
            make.top.equalTo(175)
            make.left.equalTo(38)
        }
        
        sunsetImageView.snp.makeConstraints { (make) in
            make.top.equalTo(175)
            make.right.equalTo(-38)
        }
        
        sunriseHourLabel.snp.makeConstraints { (make) in
            make.top.equalTo(sunriseImageView.snp.bottom).offset(5)
            make.left.equalTo(25)
        }
        
        sunsetHourLabel.snp.makeConstraints { (make) in
            make.top.equalTo(sunsetImageView.snp.bottom).offset(5)
            make.right.equalTo(-25)
        }
        
        cloudImageView.snp.makeConstraints { (make) in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(5)
            make.right.equalTo(windImageView.snp.left).offset(-50)
        }
        
        cloudnessLabel.snp.makeConstraints { (make) in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(5)
            make.left.equalTo(cloudImageView.snp.right).offset(6)
        }
        
        windImageView.snp.makeConstraints { (make) in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
        }
        
        windSpeedLabel.snp.makeConstraints { (make) in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(5)
            make.left.equalTo(windImageView.snp.right).offset(6)
        }
        
        rainImageView.snp.makeConstraints { (make) in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(5)
            make.left.equalTo(windImageView.snp.right).offset(50)
        }
        
        humidityLabel.snp.makeConstraints { (make) in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(5)
            make.left.equalTo(rainImageView.snp.right).offset(6)
        }
        
        nowDateLabel.snp.makeConstraints { (make) in
            make.top.equalTo(windSpeedLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
    }
    
    private func getData() {
        _ = viewModel.weatherData.observeNext { [weak self] weatherList in
            guard let self = self else { return }
            self.weatherData = weatherList
            
            if let nowDate = self.weatherData?.now {
                let nsDate = NSDate(timeIntervalSince1970: TimeInterval(nowDate))
                let date = nsDate.toString(withFormat: "E, d MMM yyyy, HH:mm")
                self.nowDateLabel.text = date
            }
            
            if let tempToday = self.weatherData?.fact?.temp, let feelsLikeToday = self.weatherData?.fact?.feelsLike, let cloudness = self.weatherData?.fact?.cloudness, let windSpeed = self.weatherData?.fact?.windSpeed, let humidity = self.weatherData?.fact?.humidity {
                self.subTemperatureLabel.text = "\(String(describing: tempToday))°/\(String(describing: feelsLikeToday))°"
                self.temperatureLabel.text = "\(String(describing: tempToday))°"
                self.cloudnessLabel.text = "\(String(describing: cloudness))"
                self.windSpeedLabel.text = "\(String(describing: windSpeed)) м/с"
                self.humidityLabel.text = "\(String(describing: humidity)) %"
            }
            
            
            if self.weatherData?.fact?.condition == "clear" {
                self.descriptionLabel.text = "Ясно"
            } else if self.weatherData?.fact?.condition == "partly-cloudy" {
                self.descriptionLabel.text = "Малооблачно"
            } else if self.weatherData?.fact?.condition == "cloudy" {
                self.descriptionLabel.text = "Облачно с прояснениями"
            } else if self.weatherData?.fact?.condition == "overcast" {
                self.descriptionLabel.text = "Пасмурно"
            } else if self.weatherData?.fact?.condition == "overcast-and-light-snow" {
                self.descriptionLabel.text = "Пасмурно и небольшой снег"
            }
            
            for forecast in self.weatherData?.forecasts ?? [] {
                self.sunriseHourLabel.text = forecast.sunrise
                self.sunsetHourLabel.text = forecast.sunset
            }
        }
        
        viewModel.getWeatherData()
    }
    
    
    
    //        addSubview(subTemperatureLabel)
    //        addSubview(temperatureLabel)
    //        addSubview(descriptionLabel)
    //        addSubview(cloudImageView)
    //        addSubview(windImageView)
    //        addSubview(rainImageView)
    //        addSubview(initialTimeLabel)
    //        addSubview(endingTimeLabel)
    //        addSubview(presentDateLabel)
    
}


extension NSDate {
    
    func toString(withFormat format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        let myString = formatter.string(from: self as Date)
        let yourDate = formatter.date(from: myString)
        formatter.dateFormat = format

        return formatter.string(from: yourDate!)
    }
}
        
