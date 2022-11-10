//
//  HomeView.swift
//  EatReal-v1
//
//  Created by Zeke Rong on 11/9/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack{
            Logo()
            PostScroll()
            navBar()
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
