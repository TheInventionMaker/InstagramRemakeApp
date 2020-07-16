//
//  FirebaseInitalization.swift
//  InstagramRemakeApp
//
//  Created by James Nagler on 7/16/20.
//  Copyright © 2020 James Nagler. All rights reserved.
//
import UIKit
import Foundation
import SpriteKit
import Firebase

class FirebaseInitalization: NSObject {
    
    var db = Firestore.firestore()
    func setUpUserData(){
        let docData: [String: Any] = [
            "username": UserDefaults().getUsername(),
            "name":     UserDefaults().getName(),
            "email":    UserDefaults().getNumEmail(),
            "verified": false,
            "imageRef": "",
            "posts": [
                "post0": [
                    "timestamp": Timestamp(date: Date()),
                    "caption":  "Hexals 3 Pack",
                    "imageRef": "",
                    "likes":    12,
                    "comments": [
                        "user0": "Nice job!"
                    ]
                ]
            ],
            "followers": ["user-1","user0"],
            "following": ["user-2","user0"]
            
        ]
        
        db.collection("users").document(UserDefaults().getUsername()).setData(docData) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
        

    }
    func setDecriptionData(_ : String){
        let docData: [String: Any] = [
            "description": UserDefaults().getDescription(),
            ]
        
        db.collection("users").document(UserDefaults().getUsername()).setData(docData, merge: true) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }
    func refreshData(){
        //Refreshes Followers, Following, and Posts
        let docRef = self.db.collection("users").document(UserDefaults().getUsername())

                   docRef.getDocument { (document, error) in
                       if let document = document, document.exists {
                           let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                           print("Document data: \(dataDescription)")
                        let followers = document.data()!["followers"]
                        print("Test: \(followers as? [Any])")
                        UserDefaults().setFollowers(String((followers as? [Any])!.count))
                        let following = document.data()!["following"]
                        print("Test: \(following as? [Any])")
                        UserDefaults().setFollowing(String((following as? [Any])!.count))
                        UserDefaults().setDescription(document.data()!["description"] as! String)
                        UserDefaults().setPosts(String((document.data()!["posts"] as? [String: Any])!.count))
                       } else {
                           print("Document does not exist")
                       }
                   }
        
    
    }
}

