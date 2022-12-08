
//
//  SavedPostView.swift
//  EatReal
//
//  Created by Zeke Rong on 12/6/22.
//

import SwiftUI

struct SavedPostView: View {
    @StateObject var viewRouter: ViewRouter
    
    
    
    var body: some View {
        
        Logo()
        Spacer()
        Text("show all saved posts here")
        Spacer()
        navBar(viewRouter: viewRouter)
    }
}

//struct SavedPostView_Previews: PreviewProvider {
//    static var previews: some View {
//        SavedPostView()
//    }
//}
