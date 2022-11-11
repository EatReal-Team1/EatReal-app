//
//  CreateProfileView.swift
//  EatReal-v1
//
//  Created by Zeke Rong on 11/10/22.
//

import SwiftUI

struct CreateProfileView: View {
    var body: some View {
            VStack(){
               
                    Logo()
                    
                
                    Spacer().frame(height: 20)
                    Text("Create Profile").font(Font.custom("Helvetica Neue", size: 40.0))
                ScrollView(){
                    Spacer().frame(height: 100)
                    
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
                        }) {
                            Text("Save")
                        }
                        .bold()
                        .font(Font.custom("Helvetica Neue", size: 25.0))
                        .padding(15)
                        .foregroundColor(Color.white)
                        .background(Color.black)
                        .cornerRadius(5)
                        Spacer().frame(width: 10)
                    }
                }
                navBar()
            }
        }
    }

struct CreateProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CreateProfileView()
    }
}
