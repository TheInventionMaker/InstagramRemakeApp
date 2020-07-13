//
//  ContentView.swift
//  InstagramRemakeApp
//
//  Created by James Nagler on 7/13/20.
//  Copyright © 2020 James Nagler. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            Text("The content of the first view")
              .tabItem {
                 Image(systemName: "house.fill").font(.title)
                 
               }
            Text("The content of the second view")
              .tabItem {
                 Image(systemName: "magnifyingglass").font(.title)
                 
               }
                
            Text("The content of the third view")
            .tabItem {
                Image(systemName: "plus.app").font(.title)
               
             }
            Text("The content of the fourth view")
            .tabItem {
                Image(systemName: "heart").font(.title)
                   
            }
            Text("The content of the fifth view")
            .tabItem {
                Image(systemName: "person.circle").font(.title)
                   
            }
        }.accentColor(Color.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
