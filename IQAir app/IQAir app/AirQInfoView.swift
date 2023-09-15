//
//  AirQInfoView.swift
//  IQAir app
//
//  Created by Miguel Villasenor on 9/15/23.
//

import SwiftUI

struct AirQInfoView: View {
    var airQInfo: AirQInfo
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .foregroundColor(backGroundColor(for: airQInfo.data.current.pollution.aqius)) // Set the desired background color
                   .padding()
                   .frame(height: 300)/// Add some padding to the background
                   .overlay(
                    VStack(alignment: .leading) {
                        Text("\(airQInfo.data.city), \(airQInfo.data.state) \(airQInfo.data.country)")
                            .font(Font.custom("Apple SD Gothic Neo", size: 25))
                            .foregroundColor(.white)
                        Text("Air Quality: \(airQInfo.data.current.pollution.aqicn)")
                        
                    }
            
        )
    
    }
}


private func backGroundColor(for airQuality: Int) -> Color {
    if airQuality < 50 {
        return Color(red: 0.47, green: 0.74, blue: 0.56)    }
    else {
        return Color(red: 1, green: 0.38, blue: 0.22)
    }
}
struct AirQInfoView_Previews: PreviewProvider {
    static var previews: some View {
        AirQInfoView(airQInfo: AirQInfo(data:  AirQData(city: "Wilmington", state: "NC", country: "USA", location: Location(type: "idk", coordinates: [0,0]), current: CurrentData(pollution: PollutionData(ts: "", aqius: 0, mainus: "", aqicn: 0, maincn: ""), weather: WeatherDetails(ts: "", tp: 0, pr: 0, hu: 0, ws: 0, wd: 0, ic: "")))))
    }
}
