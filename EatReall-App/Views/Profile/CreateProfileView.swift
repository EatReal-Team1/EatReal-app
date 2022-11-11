//
//  CreateProfileView.swift
//  EatReal-v1
//
//  Created by Zeke Rong on 11/10/22.
//

import SwiftUI

struct CreateProfileView: View {
    @State private var showProfile = false
    var body: some View {
        NavigationView{
        
            VStack(){
                
                
                Logo()
                
                
                Spacer().frame(height: 20)
                Text("Create Profile").font(Font.custom("Helvetica Neue", size: 40.0)).bold()
                
                Divider().frame(width: 300).background(Color.black).frame(height: 5)
                Spacer().frame(height: 20)
                
                
                ScrollView(){
                    
                    UploadProfilePicture()
                    
                    Spacer().frame(height: 50)
                    
                    InputName()
                    
                    Spacer().frame(height: 50)
                    
                    InputUsername()
                    
                    Spacer().frame(height: 50)
                    
                    HStack{
                        Spacer()
                        Button(action: {
                            //save
                            showProfile = true
                        }) {
                            Text("Save").bold()
                                .font(Font.custom("Helvetica Neue", size: 25.0))
                                .padding(15)
                                .foregroundColor(Color.white)
                                .background(Color.black)
                                .cornerRadius(5)
                        }
                        NavigationLink("", destination:  ProfileView(), isActive: $showProfile).navigationBarBackButtonHidden(true)
                        Spacer().frame(width: 10)
                        
                    }
                }
                
                navBar()
            }
        }
    }
}

struct CreateProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CreateProfileView()
    }
}
