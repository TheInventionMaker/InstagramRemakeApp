//
//  ImageGridView.swift
//  InstagramRemakeApp
//
//  Created by James Nagler on 7/16/20.
//  Copyright © 2020 James Nagler. All rights reserved.
//

import SwiftUI

struct ImageGridView: View {
    var body: some View {
        ScrollView{
            VStack(spacing: 2){
                ForEach(0..<5){_ in
                    HStack(spacing: 2){
                        Image("testPostImage").resizable()
                            .aspectRatio(contentMode: .fit)
                        
                        Image("testPostImage").resizable()
                        .aspectRatio(contentMode: .fit)
                        
                        Image("testPostImage").resizable()
                        .aspectRatio(contentMode: .fit)
                            
                        
                    }
                }
            }
        }
    }
}

struct ImageGridView_Previews: PreviewProvider {
    static var previews: some View {
        ImageGridView()
    }
}
