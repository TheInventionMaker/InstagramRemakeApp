//
//  createUsername.swift
//  InstagramRemakeApp
//
//  Created by James Nagler on 7/17/20.
//  Copyright © 2020 James Nagler. All rights reserved.
//

import SwiftUI
import Firebase
import Combine
struct createUsername: View {
    var email: String
    var name: String
    var password: String
    let db = Firestore.firestore()
       @State var username = ""
        @State private var showingAlert = false
           @State var title2 = ""
           @State var body2 = ""
        @State var showName = false
    @State var usernameExists = false
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
            let binding = Binding<String>(get: {
                self.username
            }, set: {
                
                self.username = $0
                self.checkCorrect()
                // do whatever you want here
            })
            
            return ZStack{
                Color.white
            NavigationView{
               
                    
                       
                        
                VStack(spacing: 20){
                    Text("Create Username")
                        .fontWeight(.light)
                        .font(.largeTitle)
                        .foregroundColor(Color(UIColor.darkGray))
                   Text("Pick a username for your account. You can always change it later.")
                   .foregroundColor(Color(UIColor.lightGray))
                   .font(.body)
                   .fontWeight(.light)
                   .multilineTextAlignment(.center)
                    .frame(width: 330, height: 50, alignment: .center)
                    ZStack{
                        
                               TextField("Username"
                                              , text: binding)
                                .font(.headline).frame(width: 330, height: 50)
                                  .textFieldStyle(MyTextFieldStyle())
                                
                        
                        Image(systemName: usernameExists ? "xmark" : "checkmark")
                            .foregroundColor(usernameExists ? .red : .green)
                            .padding(.leading, 250)
                    }
                    Button(action: {
                        if self.name != "" && self.usernameExists == false{
                            self.showName = true
                        }else if self.name == ""{
                            self.showingAlert = true
                            self.body2 = "Please fill in your username"
                            self.title2 = "Error"
                        }else{
                          self.showingAlert = true
                            self.body2 = "Username is taken"
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
                
                addPofilePhoto(email: email, name: name, password: password, username: username).opacity(showName ? 1 : 0)
                
            }
                
        .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: btnBack)
                
            .alert(isPresented: $showingAlert) {
                Alert(title: Text(title2), message: Text(body2), dismissButton: .default(Text("OK")))
            }
                /*if username != ""{
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
                }*/
            
            }
    
    func checkCorrect(){
        db.collection("users").getDocuments() { (querySnapshot, err) in
          if let err = err {
              print("Error getting documents: \(err)")
          } else {
              for document in querySnapshot!.documents {
                  if document.documentID == self.username{
                      
                      self.usernameExists = true
                    return
                  }
              }
          }
      }
        self.usernameExists = false
    }
    }

struct createUsername_Previews: PreviewProvider {
    static var previews: some View {
        createUsername(email: "nagswhiz@gmail.com", name: "James Nagler", password: "JRamo123")
    }
}
