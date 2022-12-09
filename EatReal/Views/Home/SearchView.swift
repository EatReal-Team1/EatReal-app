//
//  SearchView.swift
//  EatReal
//
//  Created by Leanne Sun on 12/1/22.
//

import SwiftUI

struct SearchView: View {
  @ObservedObject var viewRouter: ViewRouter
  @EnvironmentObject var viewModel: ViewModel
  @State private var searchText = ""
  @State var resultPosts: [Post] = []
  
    var body: some View {
      
      VStack(alignment: .leading){
        Button(action: {
          viewRouter.currentPage = .home
        }){
          Image("left-arrow").resizable()
            .frame(width: 21.0, height: 21.0)
        }.padding(.leading)
        
        NavigationStack {
          ScrollView() {
            VStack(spacing: 5) {
              Spacer()
              ForEach (resultPosts) { post in
                  PostView(post: .constant(post), viewModel: viewModel)
              }
            }
          }
        }
        .padding(.vertical, 0.0)
        .searchable(text: $searchText, prompt: "what restaurant is on your mind?")
          .onSubmit(of: .search) {
            runSearch()
          }
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
        SearchView(viewRouter: ViewRouter())
    }
}
