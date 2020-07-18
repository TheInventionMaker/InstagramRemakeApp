//
//  ContentView.swift
//  InstagramRemakeApp
//
//  Created by James Nagler on 7/13/20.
//  Copyright © 2020 James Nagler. All rights reserved.
//

import SwiftUI
struct HiddenNavigationBar: ViewModifier {
    func body(content: Content) -> some View {
        content
            .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
    }
}

extension View {
    func hiddenNavigationBarStyle() -> some View {
        modifier( HiddenNavigationBar() )
    }
}
import Firebase
struct ContentView: View {
    @State var signedUp = false
    let storage = Storage.storage()
    let storageRef = Storage.storage().reference()
    @State var begin = false
    @State var newImage = profileImage
    var body: some View {
        //Text("Jelllo")
        
        ZStack{
            if begin{
      NavigationView {
       // FileBrowserView(jsonFromCall: URLRetrieve(URLtoFetch: applicationDelegate.apiURL))
        
        
             TabView {
                Home()
                        .tabItem {
                            Image(systemName: "house.fill").font(.title)
                            
                          }
                      Search()
                         .tabItem {
                            Image(systemName: "magnifyingglass").font(.title)
                            
                          }
                           
                       Plus()
                       .tabItem {
                           Image(systemName: "plus.app").font(.title)
                          
                        }
                       Heart()
                       .tabItem {
                           Image(systemName: "heart").font(.title)
                              
                       }
                       Profile()
                       .tabItem {
                           Image(systemName: "person.circle").font(.title)
                              
                       }
                       }.accentColor(Color.black)
                
            .navigationBarItems(leading:
                HStack{
                Button(action: {
                    print("camera hit")
                    
                }, label: {
                    Image(systemName: "camera.fill").foregroundColor(.black).font(.title)
                })
                    Text("Instanote")
                        .padding(.leading, 70)
                        
                   .font(Font.custom("Billabong", size: 50))
                },
                trailing:
                HStack(spacing: 20){
                    Button(action: {
                        print("tv hit")
                    }, label: {
                        Image(systemName: "tv").foregroundColor(.black).font(.title)
                    })
                    Button(action: {
                    print("Paperplane hit")
                }, label: {
                    Image(systemName: "paperplane.fill").foregroundColor(.black).font(.title)
                })
                    
                    
                }
            )
        
        }
       
        .hiddenNavigationBarStyle()
            
            LoginOrSignUp().opacity(self.signedUp ? 0 : 1)
            }
        }
        
          .onAppear{
            //FirebaseInitalization().setUpUserData()
            print("Loaded")
                let exRef = UserDefaults().getUsername()
                let islandRef = self.storageRef.child("\(exRef)/PI")
            //let storageRef = Storage.storage().reference()
                // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
                islandRef.getData(maxSize: 100 * 1024 * 1024) { data, error in
                  if let error = error {
                    // Uh-oh, an error occurred!
                    print(error)
                  } else {
                    print("called")
                    // Data for "images/island.jpg" is returned
                    if exRef != ""{
                    let image = UIImage(data: data!)
                    print(image)
                       profileImage = image
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
                        self.begin.toggle()
                    })
                    }else{
                         self.begin.toggle()
                    }
                  }
                }
                    
            //self.begin.toggle()
                UserDefaults().setSignUp(true)
                if UserDefaults().getSignUp(){
                    self.signedUp = true
                }
                
            }
        
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
