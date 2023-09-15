//
//  HomePageView.swift
//  IQAir app
//
//  Created by Miguel Villasenor on 9/15/23.
//

import SwiftUI

struct HomePageView: View {
    @StateObject private var vm = AirQViewModel()
    var body: some View {
        NavigationView {
            ScrollView {
                Text("Current Location")
                AirQInfoView(airQInfo: vm.nearestAirQ)
                
                Text("Favorites")
                
            }
            
        }
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
