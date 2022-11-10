//
//  InputName.swift
//  EatReal-v1
//
//  Created by Zeke Rong on 11/10/22.
//

import SwiftUI

struct InputName: View {
    @State private var name: String = ""
    var body: some View {
        Text("Name").font(Font.custom("Helvetica Neue", size: 30.0))
        HStack{
            Spacer()
            TextField("Name", text: $name)
            Spacer()
    }
    }
}

struct InputName_Previews: PreviewProvider {
    static var previews: some View {
        InputName()
    }
}
