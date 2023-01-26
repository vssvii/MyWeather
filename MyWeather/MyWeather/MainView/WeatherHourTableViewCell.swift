//
//  WeatherHourTableViewCell.swift
//  MyWeather
//
//  Created by Developer on 20.01.2023.
//

import UIKit
import SnapKit

class WeatherHourTableViewCell: UITableViewCell {
    
    var cellHourDelegate : WeatherHourCellDelegate? = nil
    
    let viewModel = WeatherViewModel()
    
    var weatherData: Weather? {
        didSet {
            weatherWeekCollectionView.reloadData()
        }
    }

    private enum CellReuseIdentifiers: String {
        case hours
        case collection
    }
    
    lazy var infoHours24Label: UILabel = {
        let infoHours24Label = UILabel()
        infoHours24Label.font = UIFont.boldSystemFont(ofSize: 24)
        let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue]
        let underlineAttributedString = NSAttributedString(string: "StringWithUnderLine", attributes: underlineAttribute)
        infoHours24Label.attributedText = underlineAttributedString
        infoHours24Label.textColor = .black
        infoHours24Label.numberOfLines = 1
        infoHours24Label.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(openAllHours))
        infoHours24Label.addGestureRecognizer(tap)
        return infoHours24Label
        }()
    
    @objc func openAllHours() {
        cellHourDelegate?.launchHourVC()
    }
    
    private lazy var weatherWeekCollectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        viewLayout.scrollDirection = .horizontal
        viewLayout.minimumLineSpacing = 16
        let weatherWeekCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: viewLayout)
        weatherWeekCollectionView.register(WeatherHourCollectionViewCell.self, forCellWithReuseIdentifier: CellReuseIdentifiers.hours.rawValue)
        weatherWeekCollectionView.showsHorizontalScrollIndicator = false
        weatherWeekCollectionView.backgroundColor = .white
        weatherWeekCollectionView.delegate = self
        weatherWeekCollectionView.dataSource = self
        return weatherWeekCollectionView
    }()
    
    private func subscribe() {
        _ = viewModel.weatherData.observeNext { [weak self] weatherList in
            guard let self = self else { return }
            self.weatherData = weatherList
        }
        
        viewModel.getWeatherData()
    }
    
    private func setupView() {
        contentView.addSubview(infoHours24Label)
        contentView.addSubview(weatherWeekCollectionView)
        
        infoHours24Label.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.right.equalTo(-16)
        }
        
        weatherWeekCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(infoHours24Label.snp.bottom).offset(10)
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

extension WeatherHourTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 24
    }
        
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellReuseIdentifiers.hours.rawValue, for: indexPath) as! WeatherHourCollectionViewCell
        weatherWeekCollectionView.reloadData()
        let forecast = weatherData?.forecasts?[indexPath.section]
        let hour = forecast?.hours?[indexPath.row]
        cell.hour.text = (hour?.hour ?? "") + ":00"
        if hour?.condition == "clear" {
            cell.weatherImage.image = UIImage(named: "sunHour")
        } else if hour?.condition == "partly-cloudy" {
            cell.weatherImage.image = UIImage(named: "partCloudHour")
        } else if hour?.condition == "cloudy" {
            cell.weatherImage.image = UIImage(named: "cloudHour")
        } else if hour?.condition == "overcast" {
            cell.weatherImage.image = UIImage(named: "overcastHour")
        } else if hour?.condition == "overcast-and-light-snow" {
            cell.weatherImage.image = UIImage(named: "light_snowHour")
        }
        
        if let temperature = hour?.temp {
            cell.weatherDegree.text = "\(String(describing: temperature))°"
        }
        return cell
    }
        
        
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
                        return CGSize(width: 42, height: 84)
    }
        
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
                        return 15
    }
        
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
                        print(indexPath.row)
    }
}


protocol WeatherHourCellDelegate {
    func launchHourVC()
}
