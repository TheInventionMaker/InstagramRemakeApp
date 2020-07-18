//
//  loginPage.swift
//  InstagramRemakeApp
//
//  Created by James Nagler on 7/17/20.
//  Copyright © 2020 James Nagler. All rights reserved.
//

import SwiftUI
import Firebase
struct loginPage: View {
    @State var shown = false
    @State var password = ""
    @State var username = ""
    @State var isValid = false
    @State var showContent = false
    @State private var showingAlert = false
    @State var title2 = ""
    @State var body2 = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
     var db = Firestore.firestore()
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
        let binding2 = Binding<String>(get: {
            self.password
        }, set: {
            
            self.password = $0
            self.checkCorrect()
            // do whatever you want here
        })
       return ZStack{
            Color.white
        NavigationView{
       ZStack{
            VStack{
                LinearGradient(gradient: Gradient(colors: [Color(UIColor.systemPink),Color(UIColor.systemPurple)]), startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
                    .frame(maxWidth: .infinity)
                    .frame(maxHeight: 300)
                
                Spacer()
            }
            VStack{
                Text("Instanote")
                  .font(Font.custom("Billabong", size: 80))
                   .padding(.top, 150)
                   .padding(.vertical, -20.0)
                    .frame(width: 400, height: 200, alignment: .top)
                    .foregroundColor(.white)
               
                Spacer()
                    .padding(.vertical, 400.0)
            }
            VStack{
                if password != "" && username != ""{
                    Text(isValid ? "Correct password and username" : "Incorrect password or username")
                        .foregroundColor(isValid ? .green : .red)
                }else{
                     Text("Please fill in all fields")
                }
                TextField("Username"
                              , text: binding)
                .font(.headline).frame(width: 330, height: 50)
                  .textFieldStyle(MyTextFieldStyle())
                SecureField("Password"
                                           , text: binding2)
                             .font(.headline).frame(width: 330, height: 50)
                               .textFieldStyle(MyTextFieldStyle())
                     
                
                 Button(action: {
                    if self.isValid == false{
                        self.showingAlert = true
                        self.body2 = "Username or password is incorrect"
                        self.title2 = "Error"
                    }else{
                        UserDefaults().setUsername(self.username)
                        FirebaseInitalization().setUpLoginUser()
                         DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                        self.showContent = true
                        })
                    }
                 }, label: {
                     Text("Login")
                         .foregroundColor(.white)
                         .font(.headline)
                         .fontWeight(.semibold)
                 })
                     .frame(width: 330, height: 50, alignment: .center)
                    
                     .background(Color.blue)
                      .cornerRadius(5)
                    .padding(.bottom, 20)
                
                HStack{
                    Text("Don't have an account?")
                        .foregroundColor(Color(UIColor.lightGray))
                    NavigationLink(destination: LoginOrSignUp()){
                        Text("Sign Up.")
                        .fontWeight(.light)
                    
                    
                    }
                   
                }
                
            }
        
        }
        .navigationBarItems(leading: btnBack)
        .alert(isPresented: $showingAlert) {
            Alert(title: Text(title2), message: Text(body2), dismissButton: .default(Text("OK")))
        }
            
        }
        ContentView().opacity(showContent ? 1 : 0)}
        //.labelsHidden()
    }
    func checkCorrect(){
        let docRef = self.db.collection("users").document(username)

        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                print("Document data: \(dataDescription)")
             let password = document.data()!["password"]
                if password as? String == self.password{
                    self.isValid = true
                }else{
                    self.isValid = false
                }
            } else {
                print("Document does not exist")
                self.isValid = false
            }
        }
    }
}

struct loginPage_Previews: PreviewProvider {
    static var previews: some View {
        loginPage()
    }
}
