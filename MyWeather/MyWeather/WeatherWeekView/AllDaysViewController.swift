//
//  AllDaysViewController.swift
//  MyWeather
//
//  Created by Developer on 26.01.2023.
//

import UIKit
import SnapKit

class AllDaysViewController: UIViewController {
    
    
    let viewModel = WeatherViewModel()
    
    var weatherData: Weather? {
        didSet {
            weekDaysCollectionView.reloadData()
            partsTableView.reloadData()
        }
    }
    
    private enum CellReuseIdentifiers: String {
        case weekDays
    }
    
    lazy var locationLabel: UILabel = {
        let locationLabel = UILabel()
        locationLabel.font = UIFont.boldSystemFont(ofSize: 18)
        return locationLabel
    }()
    
    private lazy var weekDaysCollectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        viewLayout.scrollDirection = .horizontal
        viewLayout.minimumLineSpacing = 16
        let weekDaysCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: viewLayout)
        weekDaysCollectionView.register(AllDaysCollectionViewCell.self, forCellWithReuseIdentifier: CellReuseIdentifiers.weekDays.rawValue)
        weekDaysCollectionView.showsHorizontalScrollIndicator = false
        weekDaysCollectionView.backgroundColor = .white
        weekDaysCollectionView.delegate = self
        weekDaysCollectionView.dataSource = self
        return weekDaysCollectionView
    }()
    
    
    private lazy var partsTableView: UITableView = {
        let partsTableView = UITableView(frame: .zero, style: .grouped)
        partsTableView.register(AllDaysTableViewCell.self, forCellReuseIdentifier: CellReuseIdentifiers.weekDays.rawValue)
        partsTableView.backgroundColor = .white
        partsTableView.rowHeight = 45
        partsTableView.isScrollEnabled = true
        partsTableView.delegate = self
        partsTableView.dataSource = self
        partsTableView.separatorStyle = .none
        return partsTableView
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
            
            if let city = self.weatherData?.geoObject?.locality?.name, let country = self.weatherData?.geoObject?.country?.name {
                self.locationLabel.text = "\(city), \(country)"
            }
        }
        
        viewModel.getWeatherData()
    }
    
    private func setupView() {
        
        view.backgroundColor = .white
        
        view.addSubview(locationLabel)
        view.addSubview(weekDaysCollectionView)
        view.addSubview(partsTableView)
        
        locationLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(50)
            make.left.equalTo(16)
        }
        
        weekDaysCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(locationLabel.snp.bottom).offset(40)
            make.left.equalTo(16)
        }
        
        partsTableView.snp.makeConstraints { (make) in
            make.top.equalTo(weekDaysCollectionView.snp.bottom).offset(40)
            make.left.equalTo(16)
            make.right.equalTo(-16)
        }
    }
}

extension AllDaysViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
        
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellReuseIdentifiers.weekDays.rawValue, for: indexPath) as! AllDaysCollectionViewCell
        let forecast = weatherData?.forecasts?[indexPath.section]
        cell.weekDayLabel.text = forecast?.date
        return cell
    }
        
        
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
                        return CGSize(width: 22, height: 74)
    }
        
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
                        return 18
    }
        
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
                        print(indexPath.row)
    }
}

extension AllDaysViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let forecast = weatherData?.forecasts?[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: CellReuseIdentifiers.weekDays.rawValue, for: indexPath) as! AllDaysTableViewCell
        cell.dayType.text = forecast?.parts.debugDescription
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
