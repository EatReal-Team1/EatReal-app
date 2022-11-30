//
//  Parser.swift
//  EatReal-v1
//
//  Created by Leanne Sun on 11/29/22.
//

import Foundation
import Firebase

class Parser {
  @Published var postList: [Post] = []
  var rootRef: DatabaseReference = Database.database().reference()
  var postSnapshots: [DataSnapshot] = []
  
  init() {
    
  }

  func fetchPosts() async {
//    var snapshots: [DataSnapshot] = []
//    var posts: [Post] = []

    rootRef.child("Posts").observe(.value, with: { snapshot in
      for child in snapshot.children {
        if let snapshot = child as? DataSnapshot,
           let post = Post(snapshot: snapshot) {
          self.postList.append(post)
          print("cur posts: ", self.postList.count)
        }
      }
      
    })
    print(self.postList)
    
    

//    rootRef.child("Posts").observe(.value, with: { snapshot in
//      for child in snapshot.children {
//        if let snapshot = child as? DataSnapshot{
//          self.postSnapshots.append(snapshot)
//          print("curSnapshots: ", self.postSnapshots.count)
//        }
//      }
//    })
//    ///  PROBLEM：snapshots reseted to empty after the closure above
//    print("post snapshots: ", self.postSnapshots)
//    for ss in self.postSnapshots {
//      if let post = await Post(snapshot: ss) {
//        posts.append(post)
//        print("cur posts: ", posts.count)
//      }
//    }
    
//    return self.postList
  }
  
}

