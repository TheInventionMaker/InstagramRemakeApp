//
//  Profile.swift
//  InstagramRemakeApp
//
//  Created by James Nagler on 7/13/20.
//  Copyright © 2020 James Nagler. All rights reserved.
//

import SwiftUI
import Firebase
struct Profile: View {
  
    @State var posts = false
    var db = Firestore.firestore()
    @State var followers = ""
    @State var following = ""
    @State var postsNum = ""
    var body: some View {
        ZStack{
            //Text("Loading...")
            
            if posts{
                Homepage(name: UserDefaults().getUsername(), description: UserDefaults().getDescription(), posts: postsNum, followers: followers, following: following, imageRef: UserDefaults().getImageRef())
            }
            
        }.onAppear{
            FirebaseInitalization().refreshData()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
                self.following = UserDefaults().getFollowing()
                self.followers = UserDefaults().getFollowers()
                self.postsNum = UserDefaults().getPosts()
                self.posts = true
                
            })
            self.posts = false
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
