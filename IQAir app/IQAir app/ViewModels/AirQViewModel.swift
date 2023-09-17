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
    @Published var favoriteLocations: [AirQData] = []
    @Published var favoriteAirQs: [AirQInfo] = []
    @Published var nearestAirQ = AirQInfo(data:  AirQData(city: "", state: "", country: "", current: CurrentData(pollution: PollutionData(ts: "", aqius: 0, mainus: "", aqicn: 0, maincn: ""))))
    
    init() {
        fetchNearestAirQ()
        loadFavorites()
//        UserDefaults.standard.removeObject(forKey: "favorites")
    }
    
    
    func fetchNearestAirQ() {
        Task {
            do {
                self.nearestAirQ = try await service.fetchNearestAirQ()
            }
        }
    }
    
    func fetchAirQ(city: String, state: String, country: String) async throws -> AirQInfo {
        do {
            return try await service.fetchAirQ(city: city, state: state, country: country)
        } catch {
            
            print(error.localizedDescription)
            throw(error)
        }
        
    }
    
    func addFavorite(airQInfo: AirQInfo) {
        favoriteLocations.append(airQInfo.data)
        saveFavorites()
        favoriteAirQs.append(airQInfo)
    }
    
    private func saveFavorites() {
        do {
            let encodedData = try JSONEncoder().encode(favoriteLocations)
            UserDefaults.standard.set(encodedData, forKey: "favorites")
        } catch {
            print("Failed to encode and save favorites: \(error.localizedDescription)")
        }
    }
    
    private func loadFavorites() {
        if let encodedData = UserDefaults.standard.data(forKey: "favorites") {
            Task {
                do {
                    favoriteLocations = try JSONDecoder().decode([AirQData].self, from: encodedData)
                    for location in favoriteLocations {
                        favoriteAirQs.append(try await service.fetchAirQ(city: location.city, state: location.state, country: location.country))
                    }
                } catch {
                    print("Failed to decode favorites: \(error.localizedDescription)")
                }
            }
        }
    }
    
    
}
