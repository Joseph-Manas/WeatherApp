//
//  File.swift
//  WeatherApp
//
//  Created by Joseph Faragalla on 2020-08-23.
//  Copyright © 2020 Joseph&Manas. All rights reserved.
//

import Foundation

struct WeatherResult: Codable, Identifiable {
    var id: Int
    var name: String
    var weather: [Weather]
    var main: OtherStats
    var wind: Wind
}

struct Weather: Codable {
    var main: String
    var description: String
    var icon: String
}

struct OtherStats: Codable {
    enum CodingKeys: String, CodingKey {
        case temp
        case humidity
        //Xcode will convert feels_like to feelsLike
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
    
    //numbers are large and not correct. They have to be modified before displaying
    var temp: Double
    //variables are snake_case in JSON file. have to use coding key to make them camelCase
    var feelsLike: Double
    var tempMin: Double
    var tempMax: Double
    
    var humidity: Int
}

struct Wind: Codable {
    //not sure what unit this is
    var speed: Double
    var deg: Int
}
