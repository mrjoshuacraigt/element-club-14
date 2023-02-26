//
//  FirebaseService.swift
//  element-club-14
//
//  Created by Joshua Taylor on 2/23/23.
//

import Foundation

protocol FirebaseServiceDelegate: AnyObject {
    func didFetchSummary(firewbaseService: FirebaseService, result: SummaryResult)
    
//    func didFectchExerciseData(firewbaseService: FirebaseService, result: ExerciseResult)
}

class FirebaseService {
    
    weak var delagate: FirebaseServiceDelegate?
    
//    let dataLoader = DataLoader()
    
    func fetchUserData(userId: String) {
        
        
        
        
    }
    
    func fetchSummaryData(userId: String) {

//        dataLoader.request(.city(city)) { [weak self] result in
//
//            switch result {
//            case .success(let data):
//
//                guard let weather = self?.parseJson(weatherData: data) else {
//                    DispatchQueue.main.async {
//                        self?.updateDidFetchWeather(weatherResult: .failure(.parsing))
//                    }
//                    return
//                }
//
//                let weatherModel = WeatherModel(city: weather.name, temperature: weather.main.temp, conditionId: weather.weather[0].id)
//                DispatchQueue.main.async {
//                    self?.updateDidFetchWeather(weatherResult: .success(weatherModel))
//                }
//
//            case .failure(let error):
//                DispatchQueue.main.async {
//                    self?.updateDidFetchWeather(weatherResult: .failure(error))
//                }
//            }
//        }
    }
    
    func fetchWeatherData(lat: Double, lon: Double) {

//        dataLoader.request(.latLon(lat: lat, lon: lon)) { [weak self] result in
//
//            switch result {
//            case .success(let data):
//
//                guard let weather = self?.parseJson(weatherData: data) else {
//                    DispatchQueue.main.async {
//                        self?.updateDidFetchWeather(weatherResult: .failure(.parsing))
//                    }
//                    return
//                }
//
//                let weatherModel = WeatherModel(city: weather.name, temperature: weather.main.temp, conditionId: weather.weather[0].id)
//                DispatchQueue.main.async {
//                    self?.updateDidFetchWeather(weatherResult: .success(weatherModel))
//                }
//
//            case .failure(let error):
//                DispatchQueue.main.async {
//                    self?.updateDidFetchWeather(weatherResult: .failure(error))
//                }
//            }
//        }
    }
    
    private func updateDidFetchSummary(summaryResult: SummaryResult) {
        delagate?.didFetchSummary(firewbaseService: self, result: summaryResult)
    }
    
}
