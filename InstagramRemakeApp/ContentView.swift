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
            Home()
              .tabItem {
                 Image(systemName: "house.fill").font(.title)
                 
               }
           Search()
              .tabItem {
                 Image(systemName: "magnifyingglass").font(.title)
                 
               }
                
            Plus()
            .tabItem {
                Image(systemName: "plus.app").font(.title)
               
             }
            Heart()
            .tabItem {
                Image(systemName: "heart").font(.title)
                   
            }
            Profile()
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
