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
    var img: String
    var ring: Bool
    init(w: CGFloat, h: CGFloat, imageName: String, border: Bool){
        width = w
        height = h
        img = imageName
        ring = border
    }
    var body: some View {
        ZStack{
            
                       LinearGradient(gradient: Gradient(colors: [Color.orange, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
                       .clipShape(Circle())
                        .scaleEffect(0.95)
                        .opacity(ring ? 1 : 0)
                       Circle()
                       .foregroundColor(.white)
                       .scaleEffect(0.9)
            .opacity(ring ? 1 : 0)
           Image(img).resizable()
                                 .frame(width: width, height: height, alignment: .center)
                             .clipShape(Circle())
                          
                          .scaleEffect(0.9)
                       } .frame(width: width, height: height, alignment: .center)
        
       
           
    }
}

struct TopProfileImage_Previews: PreviewProvider {
    static var previews: some View {
        TopProfileImage(w: 300, h: 200, imageName: "profileimage", border: true)
    }
}
