//
//  ViewController.swift
//  MyWeather
//
//  Created by Ibragim Assaibuldayev on 28.11.2022.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    
    let viewModel = WeatherViewModel()
    
    
    private enum CellReuseIdentifiers: String {
        case weatherHour
        case weatherWeek
    }
    
    var todayWeatherView: TodayWeatherView = {
        let todayWeatherView = TodayWeatherView()
        return todayWeatherView
    }()
    
    private lazy var locationLabel: UILabel = {
        let locationLabel = UILabel()
        locationLabel.font = UIFont.boldSystemFont(ofSize: 18)
        locationLabel.textColor = .black
        return locationLabel
    }()
    
    private lazy var geoLocation: UIButton = {
        let geoLocation = UIButton()
        return geoLocation
    }()
    
    private lazy var weatherWeekTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(WeatherWeekInfoTableViewCell.self, forCellReuseIdentifier: CellReuseIdentifiers.weatherWeek.rawValue)
        tableView.register(WeatherHourTableViewCell.self, forCellReuseIdentifier: CellReuseIdentifiers.weatherHour.rawValue)
        tableView.backgroundColor = .white
        tableView.rowHeight = 45
        tableView.isScrollEnabled = true
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        return tableView
    }()
    
    
    var weatherData: Weather? {
        didSet {
            weatherWeekTableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
        subscribe()
        
        title = "adsaff"
        
    }
    
    @objc func deleteAll() {
        print("delete")
    }
    
    private func setupView() {
//        view.backgroundColor = UIColor(hexString: "#204EC7")
        view.backgroundColor = .white
        view.addSubview(weatherWeekTableView)
        view.addSubview(locationLabel)
        
        locationLabel.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.centerX.equalToSuperview()
        }
        
        weatherWeekTableView.snp.makeConstraints { (make) in
//            make.top.equalToSuperview()
            make.top.equalTo(locationLabel.snp.bottom).offset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.left.right.equalToSuperview()
        }
    }
    
    private func subscribe() {
        _ = viewModel.weatherData.observeNext { [weak self] weatherList in
            guard let self = self else { return }
            self.weatherData = weatherList
            
            if let locality = self.weatherData?.geoObject?.locality?.name, let country = self.weatherData?.geoObject?.country?.name {
                self.locationLabel.text = "\(locality), \(country)"
            }
        }
        
        viewModel.getWeatherData()
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        var count = 0
        if tableView == tableView {
            count = 2
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(
                withIdentifier: CellReuseIdentifiers.weatherHour.rawValue, for: indexPath) as! WeatherHourTableViewCell
            cell.infoHours24Label.text = "Подробнее на 24 часа"
            cell.infoHours24Label.font = UIFont.systemFont(ofSize: 16)
            cell.cellHourDelegate = self
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: CellReuseIdentifiers.weatherWeek.rawValue, for: indexPath) as! WeatherWeekInfoTableViewCell
            cell.infoWeekLabel.text = "Подробнее на 7 дней"
            cell.infoWeekLabel.font = UIFont.systemFont(ofSize: 16)
            cell.cellDayDelegate = self
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
                return 200
        } else {
            return 550
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1 {
            return "Ежедневный прогноз"
        }
        return ""
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let view = todayWeatherView
            return view
        } else {
            return UIView()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 220
        } else {
            return 0
        }
    }
}


extension MainViewController: WeatherHourCellDelegate, WeatherDayCellDelegate {
    
    
    func launchHourVC() {
        let allHoursVC = AllHoursViewController()
        present(allHoursVC, animated: true)
    }
    
    func launchDayVC() {
        let allDaysVC = AllDaysViewController()
        present(allDaysVC, animated: true)
    }
}



