//
//  AirQViewModel.swift
//  IQAir app
//
//  Created by Miguel Villasenor on 9/15/23.
//

import Foundation

@MainActor
class AirQViewModel: ObservableObject {
    private let service = AirQService()
    @Published var airQs: [AirQInfo] = []
    @Published var nearestAirQ = AirQInfo(data:  AirQData(city: "", state: "", country: "", location: Location(type: "", coordinates: [0,0]), current: CurrentData(pollution: PollutionData(ts: "", aqius: 0, mainus: "", aqicn: 0, maincn: ""), weather: WeatherDetails(ts: "", tp: 0, pr: 0, hu: 0, ws: 0, wd: 0, ic: ""))))
    
    init() {
        
        fetchNearestAirQ()
    }

    
    func fetchNearestAirQ() {
        Task {
            do {
                self.nearestAirQ = try await service.fetchNearestAirQ()
            }
        }
    }
    

}
