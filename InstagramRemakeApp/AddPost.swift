//
//  AddPost.swift
//  InstagramRemakeApp
//
//  Created by James Nagler on 7/15/20.
//  Copyright © 2020 James Nagler. All rights reserved.
//

import SwiftUI

struct AddPost: View {
    var likes = 29456
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            
            HStack(spacing: 0){
                
            TopProfileImage(w: 75, h: 50, imageName: "profileimage", border: true, n: "", nS: 1.0)
               
                    Text("JRamo")
                        .fontWeight(.semibold)
                        .font(.headline)
                Spacer()
                Button(action: {
                    
                }, label: {
                    Image(systemName: "ellipsis")
                        .foregroundColor(.black)
                        .font(.title)
                        .padding(.horizontal)
                })
                
            }
            Image("testPostImage").resizable()
                .aspectRatio(contentMode: .fit)
            HStack{
                Button(action: {
                    
                }, label: {
                    Image(systemName: "heart")
                    .foregroundColor(.black)
                    .font(.title)
                        .padding(.leading, 10)
                })
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "message")
                    .foregroundColor(.black)
                    .font(.title)
                })
               // .padding(.horizontal)
                Button(action: {
                    
                }, label: {
                    Image(systemName: "paperplane")
                    .foregroundColor(.black)
                    .font(.title)
                })
               // .padding(.horizontal)
                Spacer()
                Button(action: {
                    
                }, label: {
                    Image(systemName: "bookmark")
                    .foregroundColor(.black)
                    .font(.title)
                        .padding(.trailing, 10.0)
                })
            }
            Text("\(likes) Likes")
                .foregroundColor(.black)
                .fontWeight(.semibold)
                .font(.headline)
                .padding([.top, .leading, .trailing], 10)
            
            Text("Jramo - A Hexals 3 pack. WS2812B led strips, with 13 leds per Hexal. Controlled via Bluetooth with an iOS app.")
                .padding([.leading, .bottom, .trailing], 10)
            
            
            
        }
    }
}

struct AddPost_Previews: PreviewProvider {
    static var previews: some View {
        AddPost()
    }
}
