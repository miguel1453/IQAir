//
//  AirQInfo.swift
//  IQAir app
//
//  Created by Miguel Villasenor on 9/15/23.
//
import Foundation

struct AirQInfo: Codable {
    let data: AirQData
}

struct AirQData: Codable {
    let city: String
    let state: String
    let country: String
    let location: Location
    let current: CurrentData
}

struct Location: Codable {
    let type: String
    let coordinates: [Double]
}

struct CurrentData: Codable {
    let pollution: PollutionData
    let weather: WeatherDetails
}

struct PollutionData: Codable {
    let ts: String
    let aqius: Int
    let mainus: String
    let aqicn: Int
    let maincn: String
}

struct WeatherDetails: Codable {
    let ts: String
    let tp: Double
    let pr: Double
    let hu: Double
    let ws: Double
    let wd: Double
    let ic: String
}
