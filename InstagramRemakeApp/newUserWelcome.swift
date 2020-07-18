//
//  newUserWelcome.swift
//  InstagramRemakeApp
//
//  Created by James Nagler on 7/17/20.
//  Copyright © 2020 James Nagler. All rights reserved.
//

import SwiftUI
import Firebase
struct newUserWelcome: View {
   var email: String
         var name: String
         var password: String
         var username: String
         var profileImage: UIImage
    var bio: String
          @State var showImagePicker: Bool = false
             @State private var showingAlert = false
                @State var title2 = ""
                @State var body2 = ""
             @State var showName = false
     @State var toggle = false
         let storageRef = Storage.storage().reference()
    
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
                
                    
                         
                            
                      
                     VStack(spacing: 10){
                         Text("Welcoemt to Instanote, \(username)")
                             .fontWeight(.light)
                             .font(.largeTitle)
                             .foregroundColor(Color(UIColor.darkGray))
                             .padding(.top, 50)
                            .frame(width: 330)
                            .multilineTextAlignment(.center)
                        Text("Find people to follow and start sharing photos. You can change your username anytime.")
                        .foregroundColor(Color(UIColor.lightGray))
                        .font(.body)
                        .fontWeight(.light)
                        .frame(width: 330)
                        .multilineTextAlignment(.center)
                             
                             
                                    
                        Button(action: {
                            self.toggle.toggle()
                            UserDefaults().setName(self.name)
                            UserDefaults().setPassword(self.password)
                            UserDefaults().setNumEmail(self.email)
                            UserDefaults().setUsername(self.username)
                            UserDefaults().setDescription(self.bio)
                            UserDefaults().setSignUp(true)
                            FirebaseInitalization().setUpUserData()
                            FirebaseInitalization().uploadImage(image: self.profileImage, ref: "\(UserDefaults().getUsername())/PI")
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
                        
                     }
                     
                     
                     ContentView().opacity(toggle ? 1 : 0)
             .navigationBarBackButtonHidden(true)
                 .navigationBarItems(leading: btnBack)
                        
                 .alert(isPresented: $showingAlert) {
                     Alert(title: Text(title2), message: Text(body2), dismissButton: .default(Text("OK")))
                 }
                     
                     
                 }
                
         }
}

struct newUserWelcome_Previews: PreviewProvider {
    static var previews: some View {
        newUserWelcome(email: "nagswhiz@gmail.com", name: "James Nagler", password: "BillyBob123", username: "JRamo", profileImage: UIImage(named: "profileimage"   )!, bio: "I love to code and stuff.")
    }
}
