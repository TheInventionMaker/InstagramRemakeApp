//
//  LoginOrSignUp.swift
//  InstagramRemakeApp
//
//  Created by James Nagler on 7/17/20.
//  Copyright © 2020 James Nagler. All rights reserved.
//

import SwiftUI
struct MyTextFieldStyle: TextFieldStyle {
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
struct LoginOrSignUp: View {
    @State var shown = false
    var body: some View {
        NavigationView{
        ZStack{
            VStack{
                LinearGradient(gradient: Gradient(colors: [Color(UIColor.systemPink),Color(UIColor.systemPurple)]), startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
                    .frame(maxWidth: .infinity)
                    .frame(maxHeight: 300)
                
                Spacer()
            }
            VStack{
                Text("Instanote")
                  .font(Font.custom("Billabong", size: 80))
                   .padding(.top, 100)
                   .padding(.vertical, -20.0)
                    .frame(width: 400, height: 200, alignment: .top)
                    .foregroundColor(.white)
               Text("Sign up to see photos from your friends.")
                   .fontWeight(.semibold)
                   .font(.headline)
                .foregroundColor(Color(UIColor.white))
                Spacer()
                    .padding(.vertical, 300.0)
            }
            VStack{
                
                    NavigationLink(destination: emailSignUpPage()){
                        Text("Sign Up With Email")
                        .fontWeight(.semibold)
                    
                    
                    }
                
                Text("OR")
                    .foregroundColor(Color(UIColor.lightGray))
                    .fontWeight(.semibold)
                .padding(30)
                 
                HStack{
                    Text("Already have an account?")
                        .foregroundColor(Color(UIColor.lightGray))
                    
                    NavigationLink(destination: loginPage()){
                        Text("Sign in.")
                            .fontWeight(.light)
                    }
                }
                
            }
        }
        }.hiddenNavigationBarStyle()
        .labelsHidden()
    }
}
struct emailSignUpPage: View {
    @State var phoneEmail = ""
    @State private var showingAlert = false
       @State var title2 = ""
       @State var body2 = ""
    @State var showName = false
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
        NavigationView{
           
                
                   
                    
            VStack(spacing: 20){
                Text("Enter Email")
                    .fontWeight(.light)
                    .font(.largeTitle)
                    .foregroundColor(Color(UIColor.darkGray))
                Rectangle()
                                   .foregroundColor(Color(UIColor.lightGray))
                                   .frame(width: 330, height: 2, alignment: .center)
                    .padding(.bottom, 50)
                           TextField("Email"
                                          , text: $phoneEmail)
                            .font(.headline).frame(width: 330, height: 50)
                              .textFieldStyle(MyTextFieldStyle())
                    
               
                Button(action: {
                    if self.phoneEmail != ""{
                        self.showName = true
                    }else{
                        self.showingAlert = true
                        self.body2 = "Please fill in your email address"
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
                Text("You will not receive emails from this nonexistent company.")
                    .foregroundColor(Color(UIColor.lightGray))
                    .font(.caption)
                    .fontWeight(.light)
                    .multilineTextAlignment(.center)
                Spacer()
                Rectangle()
                .foregroundColor(Color(UIColor.lightGray))
                .frame(width: 600, height: 1, alignment: .center)
                HStack{
                    
                   Text("Already have an account?")
                       .foregroundColor(Color(UIColor.lightGray))
                   
                   Button(action: {
                       
                   }, label: {
                       Text("Sign in.")
                           .fontWeight(.light)
                   })
               }
            }
            
            }
            
    .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack)
        .alert(isPresented: $showingAlert) {
            Alert(title: Text(title2), message: Text(body2), dismissButton: .default(Text("OK")))
        }
            
            nameView(email: phoneEmail).opacity(showName ? 1 : 0)
        }
    }
}
struct LoginOrSignUp_Previews: PreviewProvider {
    static var previews: some View {
        LoginOrSignUp()
    }
}
