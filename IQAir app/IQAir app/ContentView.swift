//
//  ContentView.swift
//  IQAir app
//
//  Created by Miguel Villasenor on 9/15/23.
//

import SwiftUI

struct ContentView: View {
   
    var body: some View {
        NavigationStack {
            ScrollView {
                HomePageView()
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
