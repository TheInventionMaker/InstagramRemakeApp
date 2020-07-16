//
//  Homepage.swift
//  InstagramRemakeApp
//
//  Created by James Nagler on 7/16/20.
//  Copyright © 2020 James Nagler. All rights reserved.
//

import SwiftUI

struct Homepage: View {
    var name: String
    var description: String
    var posts: String
    var followers: String
    var following: String
    var imageRef: String
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
            TopProfileImage(w: 150, h: 100, imageName: "profileimage", border: true, n: "", nS: 0)
            VStack{
                HStack(spacing: 20){
                    VStack{
                       Text("\(posts)")
                        .fontWeight(.semibold)
                        .font(.title)
                        Text("posts")
                        .fontWeight(.light)
                            .font(.headline)
                    }
                    VStack{
                       Text("\(followers)")
                        .fontWeight(.semibold)
                        .font(.title)
                        Text("followers")
                        .fontWeight(.light)
                        .font(.body)
                    }
                    VStack{
                       Text("\(following)")
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
            Text(name)
                .fontWeight(.semibold)
                .font(.headline)
                .padding(.leading, 30.0)
                .padding(.bottom, 10)
            Text(description)
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
        Homepage(name: "JRamo", description: "I code and stuff.", posts: "2", followers: "0", following: "6", imageRef: "profileimage")
    }
}
