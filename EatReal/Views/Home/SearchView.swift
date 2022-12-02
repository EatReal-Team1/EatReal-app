//
//  SearchView.swift
//  EatReal
//
//  Created by Leanne Sun on 12/1/22.
//

import SwiftUI

struct SearchView: View {
  @StateObject var viewRouter: ViewRouter
  @StateObject var viewModel: ViewModel
  @State private var searchText = ""
//  @State var resultPosts = [Post]()
  @State var resultPosts: [Post] = []
  
    var body: some View {
      
      VStack{
//        Button(action: {
//          viewRouter.currentPage = .home
//        }){
//          Image("left-arrow").resizable()
//            .frame(width: 14.0, height: 14.0)
//        }//.frame(alignment: .leading)

        NavigationStack {
          ScrollView() {
            VStack(spacing: 5) {
              Spacer()
              Spacer()
              ForEach (resultPosts) { post in
                PostView(post: .constant(post))
              }
            }
          }
        }
        .padding(.vertical, 0.0)
        .searchable(text: $searchText, prompt: "what restaurant is on your mind?")
          .onSubmit(of: .search) {
            runSearch()
          }
//
//        Text(String(resultPosts.count))
//        Text(searchText)
//        Text(String(viewModel.postList.count))
        
      }
    }
  func runSearch(){
    self.resultPosts = viewModel.search(searchText: searchText)
  }
  
  func displayPosts() {
    if searchText == "" {
      resultPosts = []
    } else {
      resultPosts = viewModel.filteredPostList
    }
  }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewRouter: ViewRouter(), viewModel: ViewModel())
    }
}
