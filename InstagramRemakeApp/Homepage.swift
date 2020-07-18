//
//  Homepage.swift
//  InstagramRemakeApp
//
//  Created by James Nagler on 7/16/20.
//  Copyright © 2020 James Nagler. All rights reserved.
//

import SwiftUI
import Firebase

import SwiftUI
var profileImage = UIImage(named: "profileimage")
public struct ImagePickerView: UIViewControllerRepresentable {

    private let sourceType: UIImagePickerController.SourceType
    private let onImagePicked: (UIImage) -> Void
    @Environment(\.presentationMode) private var presentationMode

    public init(sourceType: UIImagePickerController.SourceType, onImagePicked: @escaping (UIImage) -> Void) {
        self.sourceType = sourceType
        self.onImagePicked = onImagePicked
    }

    public func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = self.sourceType
        picker.delegate = context.coordinator
        return picker
    }

    public func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    public func makeCoordinator() -> Coordinator {
        Coordinator(
            onDismiss: { self.presentationMode.wrappedValue.dismiss() },
            onImagePicked: self.onImagePicked
        )
    }

    final public class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

        private let onDismiss: () -> Void
        private let onImagePicked: (UIImage) -> Void

        init(onDismiss: @escaping () -> Void, onImagePicked: @escaping (UIImage) -> Void) {
            self.onDismiss = onDismiss
            self.onImagePicked = onImagePicked
        }

        public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let image = info[.originalImage] as? UIImage {
                self.onImagePicked(image)
            }
            self.onDismiss()
        }

        public func imagePickerControllerDidCancel(_: UIImagePickerController) {
            self.onDismiss()
        }

    }

}

struct ModalView: View {

  @Environment(\.presentationMode) private var presentationMode

  var body: some View {
    NavigationView{
        
        Text("Modal view")
        Button(action: {
           self.presentationMode.wrappedValue.dismiss()
        }) {
          Text("Dismiss")
        }
    }
  .navigationBarItems(leading: Button(action: {
     self.presentationMode.wrappedValue.dismiss()
  }) {
    Text("Dismiss")
  })
  
        

           
           
           
          /*
          HStack{
            Button(action: {
                   self.editMode = false
                self.description = self.descriptionEdit
                UserDefaults().setDescription(self.description)
                FirebaseInitalization().setDecriptionData(UserDefaults().getDescription())
               }, label: {
                   Text("Done Editing")
                       .fontWeight(.semibold)
                       .font(.headline)
                       .foregroundColor(.black)
               })
                   .padding(.vertical, 5.0)
                   .padding(.horizontal, 40)
                   .overlay(
                       RoundedRectangle(cornerRadius: 5)
                           .stroke(Color(UIColor.lightGray), lineWidth: 1)
                   )
               
               .padding(9)
            }*/
        
    
  }
}
struct Homepage: View {
    
    
    var name: String
    @State var description: String
    @State private var showModal = false

    // If you are getting the "can only present once" issue, add this here.
    // Fixes the problem, but not sure why; feel free to edit/explain below.
      @Environment(\.presentationMode) var presentationMode

    var posts: String
    var followers: String
    var following: String
    var imageRef: String
    var mine: Bool
    @State var descriptionEdit = UserDefaults().getDescription()
    @State var editMode = false
    @State var showImagePicker: Bool = false
    let storageRef = Storage.storage().reference()
    @State var newImage = profileImage
    @State var begin = true
    @State var toggle = false
    var body: some View {
        
        ZStack{
        VStack(alignment: .leading){
            if begin{
            HStack{
                ZStack{
                
                 TopProfileImage(w: 150, h: 100, image: newImage!, border: true, n: "", nS: 0)
                    Button(action: {
                         self.showImagePicker.toggle()
                    }, label: {
                       Image(systemName: "plus.circle.fill")
                        .foregroundColor(.blue)
                        
                    }).offset(x: 40, y: 40)
                }
            VStack{
                HStack(spacing: 20){
                    VStack{
                       Text("\(posts)")
                        .fontWeight(.semibold)
                        .font(.title)
                        Text("posts")
                        .fontWeight(.light)
                            .font(.headline)
                    }
                    VStack{
                       Text("\(followers)")
                        .fontWeight(.semibold)
                        .font(.title)
                        Text("followers")
                        .fontWeight(.light)
                        .font(.body)
                    }
                    VStack{
                       Text("\(following)")
                        .fontWeight(.semibold)
                        .font(.title)
                        Text("following")
                        .fontWeight(.light)
                        .font(.body)
                    }
                }
                if mine == false{
                HStack{
                    Button(action: {
                        
                    }, label: {
                        Text("Message")
                            .fontWeight(.semibold)
                            .font(.headline)
                            .foregroundColor(.black)
                    })
                        .padding(.vertical, 5.0)
                        .padding(.horizontal, 40)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color(UIColor.lightGray), lineWidth: 1)
                        )
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "person.fill")
                            .foregroundColor(.black)
                    })
                        .padding(9)
                    
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color(UIColor.lightGray), lineWidth: 1)
                        )
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "arrowtriangle.down.fill")
                            .foregroundColor(.black)
                            .font(.callout)
                    })
                        .padding(9)
                    
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color(UIColor.lightGray), lineWidth: 1)
                        )
                }
                }else{
                HStack{
                    Button(action: {
                        self.showImagePicker = true
                        self.toggle = true
                    }, label: {
                        Text("Edit Profile")
                            .fontWeight(.semibold)
                            .font(.headline)
                            .foregroundColor(.black)
                        }).sheet(isPresented: self.$showModal) {
                            ModalView()
                        }
                        .padding(.vertical, 5.0)
                        .padding(.horizontal, 70)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color(UIColor.lightGray), lineWidth: 1)
                        )
                    
                    }.padding(9)
                }
            }.offset(x: -25, y: 0)
        }
            Text(name)
            .fontWeight(.semibold)
            .font(.headline)
            .padding(.leading, 30.0)
            .padding(.bottom, 10)
            
            
                Text(description)
                .fontWeight(.light)
                .font(.subheadline)
                .padding(.leading, 30.0)
            
                // Create a child reference
                // imagesRef now points to "images"
               
                
            //Replace the below things with the people that this user is following
            TopProfileScrollView()
            
            ImageGridView()
            .sheet(isPresented: $showImagePicker) {
                if self.toggle{
                    EditEverythingView()
                }else{
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
                        
                        self.newImage = image
                        
                      }
                    }
                }
                }
            }
            }
        }
            EditEverythingView().opacity(showEverything ? 1 : 0)
        }
    }
    func uploadImage(){
   }
}

struct Homepage_Previews: PreviewProvider {
    static var previews: some View {
        Homepage(name: "JRamo", description: "I code and stuff.", posts: "2", followers: "0", following: "6", imageRef: "profileimage", mine: true)
    }
}
