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
import Swift
import Firebase
import FirebaseStorage
extension UIImage {
    var jpeg: Data? { jpegData(compressionQuality: 1) }  // QUALITY min = 0 / max = 1
    var png: Data? { pngData() }
}
extension Data {
    var uiImage: UIImage? { UIImage(data: self) }
}
class FirebaseInitalization: NSObject {
    let storage = Storage.storage()
    var db = Firestore.firestore()
    func refreshCloudData(){
        let docData: [String: Any] = [
            "username": UserDefaults().getUsername(),
            "name":     UserDefaults().getName(),
            "email":    UserDefaults().getNumEmail(),
            "description": UserDefaults().getDescription(),
            "password": UserDefaults().getPassword()
            
            
        ]
        /*
         "post0": [
             "timestamp": Timestamp(date: Date()),
             "caption":  "Hexals 3 Pack",
             "imageRef": "",
             "likes":    12,
             "comments": [
                 "user0": "Nice job!"
             ]
         ]
         */
        db.collection("users").document(UserDefaults().getUsername()).setData(docData, merge: true) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
        

    }
    func setUpUserData(){
        let docData: [String: Any] = [
            "username": UserDefaults().getUsername(),
            "name":     UserDefaults().getName(),
            "email":    UserDefaults().getNumEmail(),
            "description": UserDefaults().getDescription(),
            "password": UserDefaults().getPassword(),
            "verified": false,
            "posts": [
                "exP":[
                    "ex": "",
                    "comments": [
                        "ex2": ""
                    ]
                    ]
                ],
            "followers": [],
            "following": [],
            "stories": ["exP":[
                "ex": "",
                "comments": [
                    "ex2": ""
                ]
                ]
            ]
            
        ]
        /*
         "post0": [
             "timestamp": Timestamp(date: Date()),
             "caption":  "Hexals 3 Pack",
             "imageRef": "",
             "likes":    12,
             "comments": [
                 "user0": "Nice job!"
             ]
         ]
         */
        db.collection("users").document(UserDefaults().getUsername()).setData(docData) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
        

    }
    
    func setUpLoginUser(){
       
        /*
         "post0": [
             "timestamp": Timestamp(date: Date()),
             "caption":  "Hexals 3 Pack",
             "imageRef": "",
             "likes":    12,
             "comments": [
                 "user0": "Nice job!"
             ]
         ]
         */
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
                              UserDefaults().setPosts(String((document.data()!["posts"] as? [String: Any])!.count - 1))
                              UserDefaults().setStories(String((document.data()!["stories"] as? [String: Any])!.count))
                                UserDefaults().setName(document.data()!["name"] as! String)
                                UserDefaults().setPassword(document.data()!["password"] as! String)
                                UserDefaults().setDescription(document.data()!["description"] as! String)
                                UserDefaults().setNumEmail(document.data()!["email"] as! String)
                             } else {
                                 print("Document does not exist")
                             }
                         }
        

    }
    func uploadImage(image: UIImage, ref: String){
        let storageRef = self.storage.reference()
       // Child references can also take paths delimited by '/'
       // spaceRef now points to "images/space.jpg"
       // imagesRef still points to "images"
       

       // This is equivalent to creating the full reference
       let storagePath = "gs://instanote-7cedd.appspot.com/images"
       let spaceRef = storage.reference(forURL: storagePath)
        
        
        // Data in memory
        var data = Data()
        let image = image
        data = image.pngData()!
        print(data)
        // Create a reference to the file you want to upload
        let riversRef = storageRef.child(ref)
print(riversRef)
        // Upload the file to the path "images/rivers.jpg"
        let uploadTask = riversRef.putData(data, metadata: nil) { (metadata, error) in
          guard let metadata = metadata else {
            // Uh-oh, an error occurred!
            print("error1\(error)")
            return
          }
            print("error2")
          // Metadata contains file metadata such as size, content-type.
          let size = metadata.size
          // You can also access to download URL after upload.
          riversRef.downloadURL { (url, error) in
            guard let downloadURL = url else {
              // Uh-oh, an error occurred!
                print("error3")
              return
            }
            print(downloadURL)
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
                        UserDefaults().setPosts(String((document.data()!["posts"] as? [String: Any])!.count - 1))
                        UserDefaults().setStories(String((document.data()!["stories"] as? [String: Any])!.count))
                       } else {
                           print("Document does not exist")
                       }
                   }
        
    
    }
}

