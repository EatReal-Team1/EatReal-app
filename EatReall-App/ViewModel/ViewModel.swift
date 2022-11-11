//
//  CameraViewController.swift
//  EatReal-v1
//
//  Created by Emily Feng on 11/10/22.
//

import SwiftUI

class ViewModel: ObservableObject {
  @Published var image: UIImage?
  @Published var showPicker = false
}
