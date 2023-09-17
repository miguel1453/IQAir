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
                   .frame(height: 200)/// Add some padding to the background
                   .overlay(
                    VStack(alignment: .leading) {
                        Text("\(airQInfo.data.city), \(airQInfo.data.state) \(airQInfo.data.country)")
                            .font(Font.custom("Apple SD Gothic Neo", size: 25))
                            
                        Text("Air Quality: \(airQInfo.data.current.pollution.aqicn)")
                        
                    }
            
        )
    
    }
}


private func backGroundColor(for airQuality: Int) -> Color {
    if airQuality < 50 {
        return Color(red: 0.47, green: 0.74, blue: 0.56)
    } else if airQuality < 100 {
        return Color(red: 0.75, green: 0.92, blue: 0.62)
    } else if airQuality < 150 {
        return Color(red: 1, green: 1, blue: 0.62)
    } else {
        return Color(red: 1, green: 0.38, blue: 0.22)
    }
}


//struct AirQInfoView_Previews: PreviewProvider {
//    static var previews: some View {
//        AirQInfoView(airQInfo: AirQInfo(data:  AirQData(city: "Wilmington", state: "NC", country: "USA", current: CurrentData(pollution: PollutionData(ts: "", aqius: 140, mainus: "", aqicn: 0, maincn: "")))))
//    }
//}
