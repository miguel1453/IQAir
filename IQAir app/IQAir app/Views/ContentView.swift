//
//  ContentView.swift
//  IQAir app
//
//  Created by Miguel Villasenor on 9/15/23.
//

import SwiftUI

struct ContentView: View {
    @State var isPresented: Bool = false
   
    var body: some View {
        NavigationStack {
            VStack {
                HomePageView()
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
            SearchAirQView(isPresented: $isPresented, vm:   AirQViewModel())
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
