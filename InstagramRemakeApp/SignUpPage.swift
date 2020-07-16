//
//  SignUpPage.swift
//  InstagramRemakeApp
//
//  Created by James Nagler on 7/16/20.
//  Copyright © 2020 James Nagler. All rights reserved.
//

import SwiftUI
import Firebase
let db = Firestore.firestore()
struct SignUpPage: View {
    @State var phoneEmail = ""
    @State var name = ""
    @State var username = ""
    @State var password = ""
     @State private var showingAlert = false
    @State var title2 = ""
    @State var body2 = ""
    @State var toggle = false
    var body: some View {
        ZStack{
            Color.white
           
        VStack(spacing: 20){
            Text("Instanote")
               .font(Font.custom("Billabong", size: 80))
                .padding(.horizontal, 10)
                .padding(.vertical, -20.0)
            Text("Sign up to see photos from your friends.")
                .fontWeight(.semibold)
                .font(.headline)
                .foregroundColor(Color(UIColor.lightGray))
           
           VStack(spacing: 5){
                                    HStack{
                                        Image(systemName: "envelope.fill")
                                            .font(.title)
                                            .foregroundColor(Color(UIColor.darkGray)).frame(width: 30)
                                        
                                        
                                        TextField("Email"
                                                       , text: $phoneEmail)
                                            .font(.title).frame(width: 300)
                                           
                                                
                                            
                                                
                                        
                                    }
                                    Rectangle().frame(height: 2).foregroundColor(Color(UIColor.darkGray))
                                        .frame(width: 300 + 40)
                                }
          VStack(spacing: 5){
                                    HStack{
                                        Image(systemName: "person.fill")
                                            .font(.title)
                                            .foregroundColor(Color(UIColor.darkGray)).frame(width: 30)
                                        
                                        
                                        TextField("Full Name"
                                                       , text: $name)
                                            .font(.title).frame(width: 300)
                                           
                                                
                                            
                                                
                                        
                                    }
                                    Rectangle().frame(height: 2).foregroundColor(Color(UIColor.darkGray))
                                        .frame(width: 300 + 40)
                                }
            VStack(spacing: 5){
                           HStack{
                               Image(systemName: "person.crop.circle")
                                   .font(.title)
                                   .foregroundColor(Color(UIColor.darkGray)).frame(width: 30)
                               
                               
                               TextField("Username"
                                              , text: $username)
                                   .font(.title).frame(width: 300)
                                  
                                       
                                   
                                       
                               
                           }
                           Rectangle().frame(height: 2).foregroundColor(Color(UIColor.darkGray))
                               .frame(width: 300 + 40)
                       }
            VStack(spacing: 5){
                HStack{
                    Image(systemName: "lock.fill")
                        .font(.title)
                        .foregroundColor(Color(UIColor.darkGray)).frame(width: 30)
                    
                    
                    SecureField("Password"
                                   , text: $password)
                        .font(.title).frame(width: 300)
                       
                            
                        
                            
                    
                }
                Rectangle().frame(height: 2).foregroundColor(Color(UIColor.darkGray))
                    .frame(width: 300 + 40)
            }
            
          
            
            Button(action: {
                if self.checkAllFields(){
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.6, execute: {
                        if self.usernameExists == false{
                            print("Succeded")
                            UserDefaults().setName(self.name)
                            UserDefaults().setUsername(self.username)
                            UserDefaults().setNumEmail(self.phoneEmail)
                            UserDefaults().setPassword(self.password)
                            UserDefaults().setSignUp(true)
                            FirebaseInitalization().setUpUserData()
                            self.toggle.toggle()
                        }else{
                            print("Failed")
                        }
                    })
                }
            }, label: {
                Text("Sign Up")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.vertical, 20.0)
                .padding(.horizontal, 75)
                })
                .background(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.purple]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(30)
            
            Text("By signing up, your agree to our nonexistent Terms & Privacy Policy")
                .fontWeight(.light)
                .font(.subheadline)
            .padding()
                .multilineTextAlignment(.center)
            .alert(isPresented: $showingAlert) {
                Alert(title: Text(title2), message: Text(body2), dismissButton: .default(Text("OK")))
            }
                
            
        }
        }.opacity(toggle ? 0 : 1)
        
    }
    @State var usernameExists = false
    func checkAllFields() -> Bool{
        
        if isValidPassword(password: password) == false{
            createError(title: "Error", body: "You need to create a password with 1 Uppercase, 1 Lowercase, 1 Number, 1 Special Character, and at least 8 characters in length.")
            return false
        }
        
        db.collection("users").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    if document.documentID == self.username{
                        self.createError(title: "Error", body: "Username already exists, pick another one.")
                        self.usernameExists = true
                    }
                }
            }
        }
        if usernameExists{
            return false
        }

        return true
    }
    func isValidPassword(password : String) -> Bool {
        let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[d$@$!%*?&#])[A-Za-z\\dd$@$!%*?&#]{8,}"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: password)
    }
    func createError(title : String, body: String){
        title2 = title
        body2 = body
        showingAlert = true
    }
}

struct SignUpPage_Previews: PreviewProvider {
    static var previews: some View {
        SignUpPage()
    }
}
