//
//  addBio.swift
//  InstagramRemakeApp
//
//  Created by James Nagler on 7/17/20.
//  Copyright © 2020 James Nagler. All rights reserved.
//

import SwiftUI
import Firebase
struct MyTextFieldStyle2: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
        .padding(10)
        .frame(width: 330, height: 50)
        .background(
            RoundedRectangle(cornerRadius: 5, style: .continuous)
                .stroke(Color(UIColor.lightGray), lineWidth: 1)
        ).padding()
    }
}
struct addBio: View {
        var email: String
        var name: String
        var password: String
        var username: String
        var profileImage: UIImage
    
         @State var showImagePicker: Bool = false
            @State private var showingAlert = false
               @State var title2 = ""
               @State var body2 = ""
            @State var showName = false
    @State var bio = ""
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
                        Text("Add Bio")
                            .fontWeight(.light)
                            .font(.largeTitle)
                            .foregroundColor(Color(UIColor.darkGray))
                            .padding(.top, 50)
                       Text("Add a bio so others can learn more about you.")
                       .foregroundColor(Color(UIColor.lightGray))
                       .font(.body)
                       .fontWeight(.light)
                       .multilineTextAlignment(.center)
                            
                            TextField("Bio"
                                          , text: $bio)
                            .font(.headline).frame(width: 330, height: 50)
                              .textFieldStyle(MyTextFieldStyle2())
                                   
                       Button(action: {
                           if self.bio != ""{
                              self.showName = true
                          }else{
                              self.showingAlert = true
                              self.body2 = "Please fill in your bio"
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
                       Button(action: {
                           
                               self.showName = true
                           
                       }, label: {
                           Text("Skip")
                               .foregroundColor(.blue)
                               .font(.headline)
                               .fontWeight(.semibold)
                       })
                           .frame(width: 330, height: 50, alignment: .center)
                          
                           
                            .cornerRadius(5)
                        
                        
                        Spacer()
                       
                    }
                    
                    
                    
            .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading: btnBack)
                       
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text(title2), message: Text(body2), dismissButton: .default(Text("OK")))
                }
                    newUserWelcome(email: email, name: name, password: password, username: username, profileImage: profileImage, bio: bio).opacity(showName ? 1 : 0)
                    //nameView(email: phoneEmail).opacity(showName ? 1 : 0)
                }
        }
    }

struct addBio_Previews: PreviewProvider {
    static var previews: some View {
        addBio(email: "nagswhiz@gmail.com", name: "James Nagler", password: "BobbyBob123", username: "JRamo3", profileImage: UIImage(named: "profileimage")!)
    }
}
