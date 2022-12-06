
//
//  SavedPostView.swift
//  EatReal
//
//  Created by Zeke Rong on 12/6/22.
//

import SwiftUI

struct SavedPostView: View {
    var body: some View {
        Spacer()
        Button(action: {
        
        }) {
            Text("Saved Posts").bold()
                .font(Font.custom("Helvetica Neue", size: 25.0))
                .padding(15)
                .foregroundColor(Color.white)
                .background(Color.black)
                .cornerRadius(5)
        }
        Spacer()
        
    }
    
}

struct SavedPostView_Previews: PreviewProvider {
    static var previews: some View {
        SavedPostView()
    }
}
