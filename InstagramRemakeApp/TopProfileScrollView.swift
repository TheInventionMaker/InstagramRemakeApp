//
//  TopProfileScrollView.swift
//  InstagramRemakeApp
//
//  Created by James Nagler on 7/13/20.
//  Copyright © 2020 James Nagler. All rights reserved.
//

import SwiftUI

struct TopProfileScrollView: View {
    var body: some View {
        VStack(spacing: 00){
            HStack{
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
            }
        ScrollView(.horizontal){
            HStack(spacing: -50){
                ForEach(0..<11){ n in
                    TopProfileImage(w: 150, h: 100, imageName: "profileimage", border: true, n: "JRamo", nS: 0.7)
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
