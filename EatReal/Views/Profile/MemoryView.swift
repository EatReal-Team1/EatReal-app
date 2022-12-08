//
//  MemoryView.swift
//  EatReal
//
//  Created by Zeke Rong on 12/6/22.
//

import SwiftUI

struct MemoryView: View {
    @StateObject var viewRouter: ViewRouter
    var body: some View {
        
       Text("show all previous posts here")
        Spacer()
        navBar(viewRouter: viewRouter)
    }
}

//struct MemoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        MemoryView()
//    }
//}
