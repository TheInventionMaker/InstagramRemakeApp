//
//  createPassword.swift
//  InstagramRemakeApp
//
//  Created by James Nagler on 7/17/20.
//  Copyright © 2020 James Nagler. All rights reserved.
//

import SwiftUI

struct createPassword: View {
   var email: String
    var name: String
       @State var password = ""
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
                    Text("Create a Password")
                        .fontWeight(.light)
                        .font(.largeTitle)
                        .foregroundColor(Color(UIColor.darkGray))
                   
                        
                               SecureField("Password"
                                              , text: $password)
                                .font(.headline).frame(width: 330, height: 50)
                                  .textFieldStyle(MyTextFieldStyle())
                        
                   
                    Button(action: {
                        if self.password != ""{
                            self.showName = true
                        }else{
                            self.showingAlert = true
                            self.body2 = "Please fill in your password"
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
                createUsername(email: email, name: name, password: password).opacity(showName ? 1 : 0)
                //nameView(email: phoneEmail).opacity(showName ? 1 : 0)
            }
    }
}

struct createPassword_Previews: PreviewProvider {
    static var previews: some View {
        createPassword(email: "nagswhiz@gmail.com", name: "James Nagler")
    }
}
