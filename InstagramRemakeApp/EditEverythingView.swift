//
//  EditEverythingView.swift
//  InstagramRemakeApp
//
//  Created by James Nagler on 7/17/20.
//  Copyright © 2020 James Nagler. All rights reserved.
//

import SwiftUI
import Firebase
var showEverything = false
struct EditEverythingView: View {
     @Environment(\.presentationMode) private var presentationMode
    @State var showImagePicker = false
    @State var name = UserDefaults().getName()
    @State var username = UserDefaults().getUsername()
    @State var bio = UserDefaults().getDescription()
    @State var email = UserDefaults().getNumEmail()
    let storageRef = Storage.storage().reference()
    var ogUsername = UserDefaults().getUsername()
    @State private var showingAlert = false
          @State var title2 = ""
          @State var body2 = ""
    @State var toggle = showEverything
    @State var usernameExists = false
     @State var newImage = profileImage
    @State var newNewImage = false
    var db = Firestore.firestore()
    var body: some View {
        NavigationView{
            ZStack{
                Color.white
                VStack{
                    
                       TopProfileImage(w: 300, h: 200, image: newImage!, border: true, n: "", nS: 0)
                    
                
                    
                Spacer()
            }
                VStack(spacing: 20){
                
                Button(action: {
                    self.showImagePicker.toggle()
                }, label: {
                    VStack{
                        
                
                    Text("Change Profile Photo")
                        .fontWeight(.semibold)
                        .font(.headline)
                    }
                    
                })
                
                    
                    HStack{
                        Text("Name")
                        .padding(-5)
                            .padding(.trailing, 50)
                        TextField("Name", text: $name)
                        
                    }.padding(.horizontal, 40)
                Rectangle()
                                  .foregroundColor(Color(UIColor.lightGray))
                                  .frame(width: 300, height: 1, alignment: .center)
                    .padding(.leading, 130)
                
                HStack{
                        Text("Username")
                       .padding(-5)
                            .padding(.trailing, 15)
                        TextField("Username", text: $username)
                        
                    }.padding(.horizontal, 40)
                Rectangle()
                                  .foregroundColor(Color(UIColor.lightGray))
                                  .frame(width: 300, height: 1, alignment: .center)
                    .padding(.leading, 130)
                
                HStack{
                        Text("Bio")
                       .padding(-5)
                            .padding(.trailing, 70)
                        TextField("Bio", text: $bio)
                        
                    }.padding(.horizontal, 40)
                Rectangle()
                                  .foregroundColor(Color(UIColor.lightGray))
                                  .frame(width: 300, height: 1, alignment: .center)
                    .padding(.leading, 130)
                HStack{
                        Text("Email")
                        .padding(-5)
                            .padding(.trailing, 55)
                        TextField("Email", text: $email)
                        
                }.padding(.horizontal, 40)
              Rectangle()
              .foregroundColor(Color(UIColor.lightGray))
              .frame(width: 300, height: 1, alignment: .center)
                .padding(.leading, 130)
                
                Spacer()
                    //.padding(.leading, 130)
                
                
            }
                .padding(.top, 200)
            .navigationBarItems(leading:
            
                Button(action: {
                    FirebaseInitalization().setUpUserData()
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Cancel")
                        .fontWeight(.light)
                        .font(.headline)
                        .foregroundColor(.black)
                }
            , trailing:
                HStack{
                    Text("Edit Profile")
                        .fontWeight(.bold)
                        .font(.title)
                        .padding(.trailing, 60)
            Button(action: {
                self.checkCorrect()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.6, execute: {
                    if self.usernameExists == true{
                        
                        self.showingAlert = true
                        self.body2 = "Username Exists"
                        self.title2 = "Error"
                    }else if self.username == ""{
                        
                        self.showingAlert = true
                        self.body2 = "Username Exists"
                        self.title2 = "Error"
                    }else{
                        UserDefaults().setName(self.name)
                        UserDefaults().setUsername(self.username)
                        print(self.bio)
                        UserDefaults().setDescription(self.bio)
                        print(UserDefaults().getDescription())
                        UserDefaults().setNumEmail(self.email)
                        FirebaseInitalization().refreshCloudData()
                        self.presentationMode.wrappedValue.dismiss()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                            let docRef = self.db.collection("users").document(self.ogUsername)

                            docRef.getDocument { (document, error) in
                                if let document = document, document.exists {
                                    let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                                    print("Document data: \(dataDescription)")
                                    self.db.collection("users").document(UserDefaults().getUsername()).setData(
                                        (document.data())!
                                    ) { err in
                                        if let err = err {
                                            print("Error writing document: \(err)")
                                        } else {
                                            print("Document successfully written!")
                                            if self.ogUsername != self.username{
                                                self.db.collection("users").document(self.ogUsername).delete() { err in
                                                    if let err = err {
                                                        print("Error removing document: \(err)")
                                                    } else {
                                                        print("Document successfully removed!")
                                                        
                                                    }
                                                }
                                            }
                                           // ViewController.swift

                                        }
                                    }
                                   

                                } else {
                                    print("Document does not exist")
                                }
                            }
                        })
                        

                    }
                })
            }) {
                Text("Done")
                    .fontWeight(.semibold)
                    .font(.headline)
                    .foregroundColor(.blue)
            }
                }
            )
            
            
            }
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text(title2), message: Text(body2), dismissButton: .default(Text("OK")))
                }
            .sheet(isPresented: $showImagePicker) {
                ImagePickerView(sourceType: .photoLibrary) { image in
                     FirebaseInitalization().uploadImage(image: image,ref: String("\(UserDefaults().getUsername())/PI"))
                    UserDefaults().setImageRef(String("\(UserDefaults().getUsername())/PI"))
                    let exRef = UserDefaults().getImageRef()
                    let islandRef = self.storageRef.child(exRef)

                    // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
                    islandRef.getData(maxSize: 100 * 1024 * 1024) { data, error in
                        if error != nil {
                        // Uh-oh, an error occurred!
                      } else {
                        // Data for "images/island.jpg" is returned
                        let image = UIImage(data: data!)
                        self.showingAlert = true
                        self.body2 = "The change was a success, but the new profile image will only be visible after the app is closed and reopened again."
                        self.title2 = "Success, But..."
                        profileImage = image
                            self.newImage = image
                            
                      }
                    }
                }
            }
            
        }.opacity(toggle ? 0 : 1)
    }
    func checkCorrect(){
        print(username)
        db.collection("users").getDocuments() { (querySnapshot, err) in
          if let err = err {
              print("Error getting documents: \(err)")
          } else {
              for document in querySnapshot!.documents {
                if document.documentID == self.username && document.documentID != self.ogUsername{
                      
                      self.usernameExists = true
                    return
                  }
              }
          }
      }
        self.usernameExists = false
    }

}

struct EditEverythingView_Previews: PreviewProvider {
    static var previews: some View {
        EditEverythingView()
    }
}
