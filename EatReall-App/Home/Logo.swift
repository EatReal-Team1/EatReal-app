//
//  Logo.swift
//  EatReal-v1
//
//  Created by Zeke Rong on 11/9/22.
//

import SwiftUI

struct Logo: View {
    var body: some View {
        HStack{
            Image("logo").resizable()
                .frame(width: 115.0, height: 70.0)
            Spacer()
        }
    }
}

struct Logo_Previews: PreviewProvider {
    static var previews: some View {
        Logo()
    }
}
