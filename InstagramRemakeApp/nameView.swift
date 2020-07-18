//
//  nameView.swift
//  InstagramRemakeApp
//
//  Created by James Nagler on 7/17/20.
//  Copyright © 2020 James Nagler. All rights reserved.
//

import SwiftUI

struct nameView: View {
    var email: String
   @State var name = ""
    @State private var showingAlert = false
       @State var title2 = ""
       @State var body2 = ""
    @State var showName = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var btnBack : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
           
                Image(systemName: "chevron.left")
                    .foregroundColor(.black)
                    .font(.title)
            }
        }
    }
    var body: some View {
        ZStack{
            Color.white
        NavigationView{
           
                
                   
                    
            VStack(spacing: 20){
                Text("Add Your Name")
                    .fontWeight(.light)
                    .font(.largeTitle)
                    .foregroundColor(Color(UIColor.darkGray))
               Text("Add your name so friends can find you.")
               .foregroundColor(Color(UIColor.lightGray))
               .font(.body)
               .fontWeight(.light)
               .multilineTextAlignment(.center)
                    
                           TextField("Full Name"
                                          , text: $name)
                            .font(.headline).frame(width: 330, height: 50)
                              .textFieldStyle(MyTextFieldStyle())
                    
               
                Button(action: {
                    if self.name != ""{
                        self.showName = true
                    }else{
                        self.showingAlert = true
                        self.body2 = "Please fill in your full name"
                        self.title2 = "Error"
                    }
                }, label: {
                    Text("Next")
                        .foregroundColor(.white)
                        .font(.headline)
                        .fontWeight(.semibold)
                })
                    .frame(width: 330, height: 50, alignment: .center)
                   
                    .background(Color.blue)
                     .cornerRadius(5)
                
                Spacer()
                Rectangle()
                .foregroundColor(Color(UIColor.lightGray))
                .frame(width: 600, height: 1, alignment: .center)
                HStack{
                    
                   Text("Already have an account?")
                       .foregroundColor(Color(UIColor.lightGray))
                   
                   NavigationLink(destination: loginPage()){
                       Text("Sign in.")
                           .fontWeight(.light)
                   }
               }
            }
            
            }
            
    .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack)
        .alert(isPresented: $showingAlert) {
            Alert(title: Text(title2), message: Text(body2), dismissButton: .default(Text("OK")))
        }
            
            createPassword(email: email, name: name).opacity(showName ? 1 : 0)
        }
}
}

struct nameView_Previews: PreviewProvider {
    static var previews: some View {
        nameView(email: "nagswhiz@gmail.com")
    }
}
