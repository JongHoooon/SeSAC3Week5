//
//  WeatherManager.swift
//  SeSAC3Week5
//
//  Created by JongHoon on 2023/08/17.
//

import Foundation

import Alamofire
import SwiftyJSON

class WeatherManager {
    
    static let shared = WeatherManager()
    private init() {}
    
    func callRequestString(completionHandler: @escaping (String, String) -> Void) {
        let url = "https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=\(APIKey.weatherKey)"
        
        AF.request(
            url,
            method: .get
        )
        .validate()
        .responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                
                print("------------------------------")
                 
                let temp = json["main"]["temp"].doubleValue - 273.15
                let humidity = json["main"]["humidity"].intValue
                
                completionHandler("\(temp)", "\(humidity)")
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func callRequestJSON(completionHandler: @escaping (JSON) -> Void) {
        let url = "https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=\(APIKey.weatherKey)"
        
        AF.request(
            url,
            method: .get
        )
        .validate()
        .responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                
                print("------------------------------")
                 
                completionHandler(json)
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func callRequestCodable(
        success: @escaping (WeatherData) -> Void,
        failure: @escaping () -> Void
    ) {
        let url = "https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=\(APIKey.weatherKey)"
        
        AF.request(
            url,
            method: .get
        )
        .validate()
        .responseDecodable(
            of: WeatherData.self,
            completionHandler: { response in
                switch response.result {
                case let .success(value):
                    success(value)
                    break
                case let .failure(error):
                    print(error)
                    break
                }
            }
        )
    }
}
