//
//  SearchFriendView.swift
//  EatReal-v1
//
//  Created by Zeke Rong on 11/8/22.
//

import SwiftUI

struct SearchFriendView: View {
    @ObservedObject var viewModel: ViewModel = ViewModel()
    @State private var searchText = ""
    @State var resultUsers: [User] = []
    @State var searched: Bool = false
    
    var body: some View {
          VStack(alignment: .leading){
            NavigationStack {
              if (searched && resultUsers == []){
                Text("No user found.").padding(20)
              } else {
                ScrollView() {
                  VStack(spacing: 5) {
                    Spacer()
                    HStack{
                      ForEach (resultUsers) { user in
                        PreviewUserView(selfUser: .constant(viewModel.currentUser), user: .constant(user))
                      }
                    }
                    
                  }
                }
              }
            } // NavigationStack
            .padding(.vertical, 0.0)
            .searchable(text: $searchText, prompt: "Please type in username")
              .onSubmit(of: .search) {
                runSearch()
              }
          } // VStack
    }
  func runSearch() {
    self.resultUsers = viewModel.searchUsers(searchText: self.searchText)
    searched = true
    print(resultUsers.count)
//    print(self.resultUsers[0].profile_picture.url)
  }
  
}

//struct SearchFriendView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchFriendView()
//    }
//}
