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
        ScrollView(.horizontal){
            HStack(spacing: -50){
                ForEach(0..<11){ n in
                    TopProfileImage(w: 150, h: 100, imageName: "profileimage", border: true)
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
