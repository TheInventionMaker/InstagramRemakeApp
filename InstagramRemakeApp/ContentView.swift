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
struct ContentView: View {
    @State var signedUp = false
    var body: some View {
        ZStack{
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
            .onAppear{
                //UserDefaults().setSignUp(false)
                if UserDefaults().getSignUp(){
                    self.signedUp = true
                }
            
            }
            SignUpPage().opacity(self.signedUp ? 0 : 1)
        }
            
        
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
