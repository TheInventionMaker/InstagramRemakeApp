//
//  addPofilePhoto.swift
//  InstagramRemakeApp
//
//  Created by James Nagler on 7/17/20.
//  Copyright © 2020 James Nagler. All rights reserved.
//

import SwiftUI
import Firebase
struct addPofilePhoto: View {
    var email: String
    var name: String
    var password: String
    var username: String
     @State var showImagePicker: Bool = false
        @State private var showingAlert = false
           @State var title2 = ""
           @State var body2 = ""
        @State var showName = false
    let storageRef = Storage.storage().reference()
    @State var profileImage = UIImage(named: "profileimage")
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
           
               
                    
                       
                 Image("profileImage-1")
                VStack(spacing: 10){
                    Text("Add Profile Photo")
                        .fontWeight(.light)
                        .font(.largeTitle)
                        .foregroundColor(Color(UIColor.darkGray))
                        .padding(.top, 50)
                   Text("Add a profile photo so your frineds know it's you.")
                   .foregroundColor(Color(UIColor.lightGray))
                   .font(.body)
                   .fontWeight(.light)
                   .multilineTextAlignment(.center)
                        
                            
                               
                   
                    
                    
                    Spacer()
                    Rectangle()
                    .foregroundColor(Color(UIColor.lightGray))
                    .frame(width: 600, height: 1, alignment: .center)
                    VStack{
                        Button(action: {
                            self.showImagePicker.toggle()
                        }, label: {
                            Text("Add a Photo")
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
                      
                   }
                }
                
                
                
        .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: btnBack)
                    .sheet(isPresented: $showImagePicker) {
                        ImagePickerView(sourceType: .photoLibrary) { image in
                             FirebaseInitalization().uploadImage(image: image,ref: String("\(UserDefaults().getUsername())/PI"))
                            UserDefaults().setImageRef(String("\(UserDefaults().getUsername())/PI"))
                            let exRef = UserDefaults().getImageRef()
                            let islandRef = self.storageRef.child(exRef)

                            // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
                            islandRef.getData(maxSize: 100 * 1024 * 1024) { data, error in
                              if let error = error {
                                // Uh-oh, an error occurred!
                              } else {
                                // Data for "images/island.jpg" is returned
                                let image = UIImage(data: data!)
                                
                                self.profileImage = image
                                self.showName = true
                                
                              }
                            }
                        }
                    }
            .alert(isPresented: $showingAlert) {
                Alert(title: Text(title2), message: Text(body2), dismissButton: .default(Text("OK")))
            }
                addBio(email: email, name: name, password: password, username: username, profileImage: profileImage!).opacity(showName ? 1 : 0)
                //nameView(email: phoneEmail).opacity(showName ? 1 : 0)
            }
    }
}

struct addPofilePhoto_Previews: PreviewProvider {
    static var previews: some View {
        addPofilePhoto(email: "nagswhiz@gmail.com", name: "James nagler", password: "Bobby234", username: "JRamo3")
    }
}
