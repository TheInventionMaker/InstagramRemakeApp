//
//  TopProfileImage.swift
//  InstagramRemakeApp
//
//  Created by James Nagler on 7/13/20.
//  Copyright © 2020 James Nagler. All rights reserved.
//

import SwiftUI

struct TopProfileImage: View {
    var width: CGFloat
    var height: CGFloat
    var img: UIImage
    var ring: Bool
    var name: String
    var nameScale: CGFloat
    init(w: CGFloat, h: CGFloat, image: UIImage, border: Bool, n: String, nS: CGFloat){
        width = w
        height = h
        img = image
        ring = border
        name = n
        nameScale = nS
    }
    var body: some View {
        VStack{
            ZStack{
                
                           LinearGradient(gradient: Gradient(colors: [Color.orange, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
                           .clipShape(Circle())
                            .scaleEffect(0.95)
                            .opacity(ring ? 1 : 0)
                           Circle()
                           .foregroundColor(.white)
                           .scaleEffect(0.9)
                .opacity(ring ? 1 : 0)
                
                Image(uiImage: img).resizable()
                                     .frame(width: width, height: height, alignment: .center)
                                 .clipShape(Circle())
                              
                              .scaleEffect(0.87)
                           } .frame(width: width, height: height, alignment: .center)
            
           
               Text(name)
                          .font(.title)
                .fontWeight(.light)
                .padding(.top, -20)
            .scaleEffect(nameScale)
        }
       
    
    }
}

struct TopProfileImage_Previews: PreviewProvider {
    static var previews: some View {
        TopProfileImage(w: 300, h: 200, image: UIImage(named: "profileimage")!, border: true, n: "JRamo", nS: 1.0)
    }
}
