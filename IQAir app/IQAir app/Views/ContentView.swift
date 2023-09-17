//
//  ContentView.swift
//  IQAir app
//
//  Created by Miguel Villasenor on 9/15/23.
//

import SwiftUI

struct ContentView: View {
    @State var isPresented: Bool = false
    @StateObject var vm = AirQViewModel()
   
    var body: some View {
        NavigationStack {
            VStack {
                HomePageView(vm: vm)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                isPresented.toggle()
                            } label: {
                                Text("+")
                                    .font(.system(size: 36))
                            }
                            
                        }
                    }
                
                
            }
        }
        .sheet(isPresented: $isPresented) {
            SearchAirQView(isPresented: $isPresented, vm:  vm)
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
