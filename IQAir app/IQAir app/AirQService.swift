//
//  AirQService.swift
//  IQAir app
//
//  Created by Miguel Villasenor on 9/15/23.
//

import Foundation

struct AirQService {
    private let session: URLSession = .shared
    private let decoder = JSONDecoder()
    private let key = "13569d0e-c6c1-4228-b974-150e20fe493f"
    
    public func fetchNearestAirQ() async throws -> AirQInfo {
        guard let url = URL(string: "https://api.airvisual.com/v2/nearest_city?key=\(key)") else {
            print("ERROR: API url error")
            fatalError("Invalid URL")
        }
        let (data, _) = try await session.data(from: url)
        
        print(url)
        return try decoder.decode(AirQInfo.self, from: data)
      
    }
    
    public func fetchAirQ(city: String, state: String, country: String) async throws -> AirQInfo {
        // https://api.airvisual.com/v2/city?city=Los%20Angeles&state=California&country=USA&key=893a3a42-cae4-48e0-81f2-8d4514aa5410
        var components = URLComponents(string: "https://api.airvisual.com/v2/")
        components?.path = "/v2/city"
        components?.queryItems = [URLQueryItem(name:"city", value:city), URLQueryItem(name: "state", value: state), URLQueryItem(name: "country", value: country), URLQueryItem(name: "key", value: key)]
        print(components!.url);
        guard let url = components?.url else {fatalError("ERROR with \(city)")}
        let (data, _) = try await session.data(from: url)
        let result =  try decoder.decode(AirQInfo.self, from: data)
        print(result.data.city)
        return result
    }
}
