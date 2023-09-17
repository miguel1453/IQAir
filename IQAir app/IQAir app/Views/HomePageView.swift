//
//  HomePageView.swift
//  IQAir app
//
//  Created by Miguel Villasenor on 9/15/23.
//

import SwiftUI

struct HomePageView: View {
    @ObservedObject var vm: AirQViewModel
    var body: some View {
        NavigationView {
            ScrollView {
                Text("Current Location")
                    .font(Font.custom("Apple SD Gothic Neo", size: 30))
                    
                AirQInfoView(airQInfo: vm.nearestAirQ)
                
                Text("Favorites")
                    .font(Font.custom("Apple SD Gothic Neo", size: 30))
                ForEach(vm.favoriteAirQs) { data in
                    AirQInfoView(airQInfo: data)
                }
                
            }
            
        }
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView(vm:  AirQViewModel())
    }
}
