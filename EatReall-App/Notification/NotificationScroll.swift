//
//  NotificationScroll.swift
//  EatReal-v1
//
//  Created by Zeke Rong on 11/8/22.
//

import SwiftUI

struct NotificationScroll: View {
    var body: some View {
      ScrollView() {
        VStack(spacing: 20) {
          ForEach(0..<10) {_ in
            SingleNotificationView()
          }
        }
      }
      .frame(height: 600)
    }
}

struct NotificationScroll_Previews: PreviewProvider {
    static var previews: some View {
        NotificationScroll()
    }
}
