//
//  ContentView.swift
//  WeatherApp
//
//  Created by Joseph Faragalla on 2020-08-23.
//  Copyright © 2020 Joseph&Manas. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var cityName: String = "CityName"
    
    var body: some View {
        Text("\(cityName)")
            .onAppear(perform: loadData)
    }
    
    func loadData() {
        NetworkService.shared.getWeatherInfo(for: "London") { result in
            cityName = result.name
            print(result.name)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
