//
//  SearchAirQView.swift
//  IQAir app
//
//  Created by Miguel Villasenor on 9/15/23.
//

import SwiftUI

struct SearchAirQView: View {
    @Binding var isPresented: Bool
    @ObservedObject var vm: AirQViewModel
    @State var city: String = "Wilmington"
    @State var state: String = "North carolina"
    @State var country: String  = "usa"
    @State var airQInfo: AirQInfo? = nil
    var body: some View {
        NavigationStack {
            Form {
                Section("Search") {
                    TextField("City", text: $city)
                    TextField("State", text: $state)
                    TextField("Country", text: $country)
                }
                Button {
                    Task {
                        do {
                            let result = try await vm.fetchAirQ(city: city, state: state, country: country)
                            airQInfo = result
                        } catch {
                            print("ERROR")
                        }
                    }
                } label: {
                    Text("Submit")
                }
                
                Section("result") {
                    VStack{
                        if let airQInfo = airQInfo {
                            AirQInfoView(airQInfo: airQInfo)
                            Button {
                                vm.addFavorite(airQInfo: airQInfo)
                                isPresented.toggle()
                            } label: {
                                Text("Add")
                            }
                        }
                    }
                }
            }
        }
    }
}

struct SearchAirQView_Previews: PreviewProvider {
    static var previews: some View {
        @State var isPresented: Bool = true
        SearchAirQView(isPresented: $isPresented, vm: AirQViewModel())
    }
}
