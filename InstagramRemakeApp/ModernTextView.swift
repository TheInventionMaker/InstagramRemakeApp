//
//  ModernTextView.swift
//  InstagramRemakeApp
//
//  Created by James Nagler on 7/16/20.
//  Copyright © 2020 James Nagler. All rights reserved.
//

import SwiftUI
struct SuperTextField: View {
    
    var placeholder: Text
    @Binding var text: String
    var editingChanged: (Bool)->() = { _ in }
    var commit: ()->() = { }
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty { placeholder }
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
        }
    }
    
}
struct ModernTextView: View {
    var image: String
    var placeholder: String
    @Binding var password: String
    var length: CGFloat
    var color: Color
    var body: some View {
        VStack(spacing: 5){
                HStack{
                    Image(systemName: image)
                        .font(.title)
                        .foregroundColor(color).frame(width: 30)
                    
                    
                    SuperTextField(placeholder: Text(placeholder)
                                    .foregroundColor(color).fontWeight(.light)
                        .font(.title)
                                   , text: $password)
                        .font(.title).frame(width: length)
                       
                            
                        
                            
                    
                }
                Rectangle().frame(height: 2).foregroundColor(color)
                    .frame(width: length + 40)
            }
    }
    
}

