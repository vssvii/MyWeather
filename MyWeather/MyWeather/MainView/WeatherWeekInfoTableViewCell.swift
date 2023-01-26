//
//  WeatherWeekInfoTableViewCell.swift
//  MyWeather
//
//  Created by Developer on 23.01.2023.
//

import UIKit

class WeatherWeekInfoTableViewCell: UITableViewCell {
    
    var cellDayDelegate : WeatherDayCellDelegate? = nil


    private enum CellReuseIdentifiers: String {
        case weatherWeek
    }
    
    let viewModel = WeatherViewModel()
    
    var weatherData: Weather? {
        didSet {
            weatherWeekInTableView.reloadData()
        }
    }
    
    lazy var infoWeekLabel: UILabel = {
        let infoWeekLabel = UILabel()
        infoWeekLabel.font = UIFont.boldSystemFont(ofSize: 16)
        let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue]
        let underlineAttributedString = NSAttributedString(string: "StringWithUnderLine", attributes: underlineAttribute)
        infoWeekLabel.attributedText = underlineAttributedString
        infoWeekLabel.textColor = .black
        infoWeekLabel.numberOfLines = 1
        infoWeekLabel.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(openAllDays))
        infoWeekLabel.addGestureRecognizer(tap)
        return infoWeekLabel
    }()
    
    @objc func openAllDays() {
        cellDayDelegate?.launchDayVC()
    }
    
    
    private lazy var weatherWeekInTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(WeatherWeekTableViewCell.self, forCellReuseIdentifier: CellReuseIdentifiers.weatherWeek.rawValue)
        tableView.backgroundColor = .white
        tableView.rowHeight = 45
        tableView.isScrollEnabled = true
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private func subscribe() {
        _ = viewModel.weatherData.observeNext { [weak self] weatherList in
            guard let self = self else { return }
            self.weatherData = weatherList
        }
        
        viewModel.getWeatherData()
    }
    
    private func setupView() {
        contentView.addSubview(infoWeekLabel)
        contentView.addSubview(weatherWeekInTableView)
        
        infoWeekLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.right.equalTo(-16)
        }
        
        weatherWeekInTableView.snp.makeConstraints { (make) in
            make.top.equalTo(infoWeekLabel.snp.bottom).offset(20)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        setupView()
        subscribe()
    }

}

extension WeatherWeekInfoTableViewCell: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherData?.forecasts?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let forecast = weatherData?.forecasts?[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: CellReuseIdentifiers.weatherWeek.rawValue, for: indexPath) as! WeatherWeekTableViewCell
        // MARK: Setup description of the part of a day
        cell.weatherWeekDate.text = forecast?.date
        if forecast?.parts?.day?.condition == "clear" {
            cell.descriptionWeatherWeek.text = "Ясно"
            cell.weatherWeekImage.image = UIImage(named: "sun")
        } else if forecast?.parts?.day?.condition == "partly-cloudy" {
            cell.descriptionWeatherWeek.text = "Малооблачно"
            cell.weatherWeekImage.image = UIImage(named: "partly_cloud")
        } else if forecast?.parts?.day?.condition == "cloudy" {
            cell.descriptionWeatherWeek.text = "Облачно с прояснениями"
            cell.weatherWeekImage.image = UIImage(named: "cloud")
        } else if forecast?.parts?.day?.condition == "overcast" {
            cell.descriptionWeatherWeek.text = "Пасмурно"
            cell.weatherWeekImage.image = UIImage(named: "overcast")
        } else if forecast?.parts?.day?.condition == "overcast-and-light-snow" {
            cell.descriptionWeatherWeek.text = "Пасмурно и небольшой снег"
            cell.weatherWeekImage.image = UIImage(named: "light_snow")
        } else if forecast?.parts?.day?.condition == "cloudy-and-light-snow" {
            cell.descriptionWeatherWeek.text = "облачно и небольшой снег"
            cell.weatherWeekImage.image = UIImage(named: "cloudyLightSnow")
        }
        
        if let dayTempAvg = forecast?.parts?.day?.tempAvg, let nightTempAvg = forecast?.parts?.night?.tempAvg {
            cell.weatherWeekDegree.text = "\(String(describing: dayTempAvg))°/\(String(describing: nightTempAvg))°"
        }
        
        if let humidity = forecast?.parts?.day?.humidity {
            cell.airHumidity.text = "\(String(describing: humidity))%"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

protocol WeatherDayCellDelegate {
    func launchDayVC()
}
