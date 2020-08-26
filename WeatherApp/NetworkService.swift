//
//  NetworkService.swift
//  WeatherApp
//
//  Created by Manas Aggarwal on 26/08/20.
//  Copyright © 2020 Joseph&Manas. All rights reserved.
//

import Foundation

// **app-id** => 17f04e035b5c9326b10bb1c4c1dc9eda
// API format - https://api.openweathermap.org/data/2.5/weather?q=<insert location name>&appid=<insert app-id>

public class NetworkService {
    
    private let appID: String = "17f04e035b5c9326b10bb1c4c1dc9eda"
    private let baseURL: String = "https://api.openweathermap.org/data/2.5/weather"
    
    // Intialize as a singleton
    public static var shared: NetworkService = NetworkService()
    
    // --------------------------
    // MARK:- Methods
    // --------------------------
    
    /// Returns the weather information for the supplied location.
    /// - Parameters:
    ///   - location: Name of the location for getting the weather report.
    ///   - completion: Completion block for returning the fetched data.
    func getWeatherInfo(for location: String, _ completion: @escaping (WeatherResult) -> Void) {
        // Create params for the network call
        let params = "?q=\(location)&appid=\(appID)"
        // Create URL
        guard let url = URL(string: baseURL + params) else {
            print("ERROR!!::-> Invalid URL")
            return
        }
        // Network Call
        URLSession.shared.dataTask(with: url) { data, response, error in
            // Handle error if not nil
            if let error = error {
                print("ERROR!!::-> \(error.localizedDescription)")
            }
            // Handle result of network call
            if let data = data {
                do {
                    let json = try JSONDecoder().decode(WeatherResult.self, from: data)
                    // Create and return an object of WeatherResult
                    completion(WeatherResult(id: json.id, name: json.name, weather: json.weather, main: json.main, wind: json.wind))
                } catch {
                    print("ERROR!!::-> Failed json serialization")
                }
            }
        }.resume()
    }
}
