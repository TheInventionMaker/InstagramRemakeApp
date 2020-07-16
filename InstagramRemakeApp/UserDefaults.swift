//
//  UserDefaults.swift
//  InstagramRemakeApp
//
//  Created by James Nagler on 7/16/20.
//  Copyright © 2020 James Nagler. All rights reserved.
//

import UIKit
import Foundation
import SpriteKit
import Firebase

class UserDefaults: NSObject {
    
    var db = Firestore.firestore()
    func setSignUp(_ value: Bool){
        Foundation.UserDefaults.standard.set(value, forKey: "signUp")
        Foundation.UserDefaults.standard.synchronize()
    }
    func getSignUp() -> Bool{
        return Foundation.UserDefaults.standard.bool(forKey: "signUp")
    }
    
    func setNumEmail(_ value: String){
        Foundation.UserDefaults.standard.set(value, forKey: "numEmail")
        Foundation.UserDefaults.standard.synchronize()
    }
    func getNumEmail() -> String{
        return Foundation.UserDefaults.standard.string(forKey: "numEmail") ?? ""
    }
    
    func setName(_ value: String){
        Foundation.UserDefaults.standard.set(value, forKey: "name")
        Foundation.UserDefaults.standard.synchronize()
    }
    func getName() -> String{
        return Foundation.UserDefaults.standard.string(forKey: "name") ?? ""
    }
    
    func setUsername(_ value: String){
        Foundation.UserDefaults.standard.set(value, forKey: "username")
        Foundation.UserDefaults.standard.synchronize()
    }
    func getUsername() -> String{
        return Foundation.UserDefaults.standard.string(forKey: "username") ?? ""
    }
    
    func setPassword(_ value: String){
        Foundation.UserDefaults.standard.set(value, forKey: "password")
        Foundation.UserDefaults.standard.synchronize()
    }
    func getPassword() -> String{
        return Foundation.UserDefaults.standard.string(forKey: "password") ?? ""
    }
    
    func setDescription(_ value: String){
        Foundation.UserDefaults.standard.set(value, forKey: "description")
        Foundation.UserDefaults.standard.synchronize()
    }
    func getDescription() -> String{
        return Foundation.UserDefaults.standard.string(forKey: "description") ?? ""
    }
    
    func setImageRef(_ value: String){
        Foundation.UserDefaults.standard.set(value, forKey: "imageRef")
        Foundation.UserDefaults.standard.synchronize()
    }
    func getImageRef() -> String{
        return Foundation.UserDefaults.standard.string(forKey: "imageRef") ?? ""
    }
    
    func setFollowers(_ value: String){
        Foundation.UserDefaults.standard.set(value, forKey: "follwers")
        Foundation.UserDefaults.standard.synchronize()
    }
    func getFollowers() -> String{
        return Foundation.UserDefaults.standard.string(forKey: "follwers") ?? ""
    }
    func setFollowing(_ value: String){
        Foundation.UserDefaults.standard.set(value, forKey: "following")
        Foundation.UserDefaults.standard.synchronize()
    }
    func getFollowing() -> String{
        return Foundation.UserDefaults.standard.string(forKey: "following") ?? ""
    }
    func setPosts(_ value: String){
        Foundation.UserDefaults.standard.set(value, forKey: "posts")
        Foundation.UserDefaults.standard.synchronize()
    }
    func getPosts() -> String{
        return Foundation.UserDefaults.standard.string(forKey: "posts") ?? ""
    }
}
