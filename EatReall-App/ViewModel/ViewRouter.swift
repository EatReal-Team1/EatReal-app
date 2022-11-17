//
//  ViewRouter.swift
//  EatReal-v1
//
//  Created by Emily Feng on 11/17/22.
//

import SwiftUI
class ViewRouter: ObservableObject {
  @Published var currentPage: Page = .createProfile
}
