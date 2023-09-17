//
//  AirQInfo.swift
//  IQAir app
//
//  Created by Miguel Villasenor on 9/15/23.
//
import Foundation

struct AirQInfo: Codable, Identifiable {
    let data: AirQData
    let id = UUID()

    enum CodingKeys: String, CodingKey {
        case data
    }
}

struct AirQData: Codable {
    let city: String
    let state: String
    let country: String
//    let location: Location
    let current: CurrentData

    enum CodingKeys: String, CodingKey {
        case city
        case state
        case country
//        case location
        case current
    }
}

//struct Location: Codable {
//    let type: String
//    let coordinates: [Double]
//
//    enum CodingKeys: String, CodingKey {
//        case type
//        case coordinates
//    }
//}

struct CurrentData: Codable {
    let pollution: PollutionData
//    let weather: WeatherDetails

    enum CodingKeys: String, CodingKey {
        case pollution
//        case weather
    }
}

struct PollutionData: Codable {
    let ts: String
    let aqius: Int
    let mainus: String
    let aqicn: Int
    let maincn: String

    enum CodingKeys: String, CodingKey {
        case ts
        case aqius
        case mainus
        case aqicn
        case maincn
    }
}

//struct WeatherDetails: Codable {
//    let ts: String
//    let tp: Double
//    let pr: Double
//    let hu: Double
//    let ws: Double
//    let wd: Double
//    let ic: String
//
//    enum CodingKeys: String, CodingKey {
//        case ts
//        case tp
//        case pr
//        case hu
//        case ws
//        case wd
//        case ic
//    }
//}
