//
//  AllDaysViewController.swift
//  MyWeather
//
//  Created by Developer on 24.01.2023.
//

import UIKit
import SnapKit

class AllHoursViewController: UIViewController {

    private enum CellReuseIdentifiers: String {
        case allHours
    }
    
    let viewModel = WeatherViewModel()
    
    var weatherData: Weather? {
        didSet {
            allHoursTableView.reloadData()
        }
    }
    
    private lazy var allHoursTableView: UITableView = {
        let allHoursTableView = UITableView(frame: .zero, style: .grouped)
        allHoursTableView.register(AllHoursTableViewCell.self, forCellReuseIdentifier: CellReuseIdentifiers.allHours.rawValue)
        allHoursTableView.backgroundColor = .white
        allHoursTableView.rowHeight = 45
        allHoursTableView.isScrollEnabled = true
        allHoursTableView.delegate = self
        allHoursTableView.dataSource = self
        allHoursTableView.separatorStyle = .none
        allHoursTableView.separatorStyle = .singleLine
        return allHoursTableView
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        subscribe()
        setupView()
    }
    
    private func subscribe() {
        
        _ = viewModel.weatherData.observeNext { [weak self] weatherList in
            guard let self = self else { return }
            self.weatherData = weatherList
        }
        
        viewModel.getWeatherData()
    }
    
    private func setupView() {
        
        view.backgroundColor = .white
        view.addSubview(allHoursTableView)
        
        allHoursTableView.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.right.bottom.equalToSuperview()
        }
    }
}

extension AllHoursViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 24
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let forecast = weatherData?.forecasts?[indexPath.section]
        let hours = forecast?.hours?[indexPath.row]
        let cell = tableView.dequeueReusableCell(
            withIdentifier: CellReuseIdentifiers.allHours.rawValue, for: indexPath) as! AllHoursTableViewCell
        cell.backgroundColor = UIColor(hexString: "#E9EEFA")
        if let nowDate = self.weatherData?.now, let hour = hours?.hour, let temp = hours?.temp, let feelsLike = hours?.feelsLike, let windSpeed = hours?.windSpeed, let airHumidity = hours?.humidity, let  cloudness = hours?.cloudness {
            let nsDate = NSDate(timeIntervalSince1970: TimeInterval(nowDate))
            let date = nsDate.toString(withFormat: "E, d MMM")
            cell.weekDayLabel.text = date
            cell.hourLabel.text = "\(String(describing: hour)):00"
            cell.temperatureLabel.text = "\(String(describing: temp))°"
            cell.feelsLikeResultLabel.text = "\(feelsLike)°"
            cell.windSpeedResultLabel.text = "\(windSpeed) м/с"
            cell.humidityResultLabel.text = "\(airHumidity) %"
            cell.cloudResultLabel.text = "\(cloudness) %"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 190
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Прогноз на 24 часа"
    }
}
