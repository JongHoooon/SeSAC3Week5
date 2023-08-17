//
//  Weather.swift
//  SeSAC3Week5
//
//  Created by JongHoon on 2023/08/17.
//

import Foundation

// MARK: - VideoListResponse
struct WeatherData: Codable {
    let weather: [Weather]?
    let id: Int?
    let name: String?
    let coord: Coord?
    let main: Main?
    let timezone, cod: Int?
    let sys: Sys?
    let base: String?
    let visibility: Int?
    let wind: Wind?
    let clouds: Clouds?
    let dt: Int?
}

// MARK: - Clouds
struct Clouds: Codable {
    let all: Int?
}

// MARK: - Coord
struct Coord: Codable {
    let lat, lon: Double?
}

// MARK: - Main
struct Main: Codable {
    let seaLevel: Int?
    let tempMin, tempMax: Double?
    let grndLevel: Int?
    let feelsLike: Double?
    let humidity: Int?
    let temp: Double?
    let pressure: Int?

    enum CodingKeys: String, CodingKey {
        case seaLevel = "sea_level"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case grndLevel = "grnd_level"
        case feelsLike = "feels_like"
        case humidity, temp, pressure
    }
}

// MARK: - Sys
struct Sys: Codable {
    let sunrise, sunset, type: Int?
    let country: String?
    let id: Int?
}

// MARK: - Weather
struct Weather: Codable {
    let icon, description: String?
    let id: Int?
    let main: String?
}

// MARK: - Wind
struct Wind: Codable {
    let gust: Double?
    let deg: Int?
    let speed: Double?
}
