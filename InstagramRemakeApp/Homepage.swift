//
//  Homepage.swift
//  InstagramRemakeApp
//
//  Created by James Nagler on 7/16/20.
//  Copyright © 2020 James Nagler. All rights reserved.
//

import SwiftUI

struct Homepage: View {
    var body: some View {
        VStack(alignment: .leading){
            HStack{
            TopProfileImage(w: 150, h: 100, imageName: "profileimage", border: true, n: "", nS: 0)
            VStack{
                HStack(spacing: 20){
                    VStack{
                       Text("5,076")
                        .fontWeight(.semibold)
                        .font(.title)
                        Text("posts")
                        .fontWeight(.light)
                            .font(.headline)
                    }
                    VStack{
                       Text("3.3M")
                        .fontWeight(.semibold)
                        .font(.title)
                        Text("followers")
                        .fontWeight(.light)
                        .font(.body)
                    }
                    VStack{
                       Text("963")
                        .fontWeight(.semibold)
                        .font(.title)
                        Text("following")
                        .fontWeight(.light)
                        .font(.body)
                    }
                }
                HStack{
                    Button(action: {
                        
                    }, label: {
                        Text("Message")
                            .fontWeight(.semibold)
                            .font(.headline)
                            .foregroundColor(.black)
                    })
                        .padding(.vertical, 5.0)
                        .padding(.horizontal, 40)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color(UIColor.lightGray), lineWidth: 1)
                        )
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "person.fill")
                            .foregroundColor(.black)
                    })
                        .padding(9)
                    
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color(UIColor.lightGray), lineWidth: 1)
                        )
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "arrowtriangle.down.fill")
                            .foregroundColor(.black)
                            .font(.callout)
                    })
                        .padding(9)
                    
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color(UIColor.lightGray), lineWidth: 1)
                        )
                }
               
            }.offset(x: -25, y: 0)
        }
            Text("JRamo")
                .fontWeight(.semibold)
                .font(.headline)
                .padding(.leading, 30.0)
                .padding(.bottom, 10)
            Text("I teach Swift, and help others undestand the vast world of programming that is iOS Development.")
            .fontWeight(.light)
            .font(.subheadline)
            .padding(.leading, 30.0)
            
            //Replace the below things with the people that this user is following
            TopProfileScrollView()
            
            ImageGridView()
        }
    }
}

struct Homepage_Previews: PreviewProvider {
    static var previews: some View {
        Homepage()
    }
}
