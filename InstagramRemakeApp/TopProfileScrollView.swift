//
//  TopProfileScrollView.swift
//  InstagramRemakeApp
//
//  Created by James Nagler on 7/13/20.
//  Copyright © 2020 James Nagler. All rights reserved.
//

import SwiftUI
import Firebase
struct TopProfileScrollView: View {
    @State var begin = true
    @State var newImage = profileImage
    var body: some View {
        VStack(spacing: 00){
            /*HStack{
                Text("Stories")
                    .fontWeight(.semibold)
                    .font(.headline)
                .padding(.horizontal, 20)
                Spacer()
                Button(action: {
                    print("Hello")
                }, label: {
                    HStack{
                        Image(systemName: "arrowtriangle.right.fill")
                    Text("Watch All")
                        .fontWeight(.semibold)
                        .font(.headline)
                    }
                        .foregroundColor(.black)
                }).padding(.horizontal, 20)
            }*/
            if begin{
                ScrollView(.horizontal){
                    HStack(spacing: -50){
                        if (Int(UserDefaults().getStories())! - 1) == 0{
                            TopProfileImage(w: 100, h: 100, image: UIImage(named: "profileimage")!, border: false, n: "Your Story", nS: 0.7)
                        }
                        ForEach(0..<(Int(UserDefaults().getStories())! - 1)){ n in
                           
                            TopProfileImage(w: 150, h: 100, image: self.newImage!, border: true, n: "JRamo", nS: 0.7)
                        }
                    }
                }
            }
        }
        
    }
}

struct TopProfileScrollView_Previews: PreviewProvider {
    static var previews: some View {
        TopProfileScrollView()
    }
}
