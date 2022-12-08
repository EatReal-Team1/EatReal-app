//
//  NotificationManager.swift
//  EatReal
//
//  Created by Emily Feng on 12/7/22.
//

import Foundation
import SwiftUI
class LocalNotificationManager: ObservableObject {
  var notifications = [Notification]()
  
  init(){
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
      if granted == true && error == nil {
        print("Notification permitted")
      } else {
        print("Notification DENIED")
      }
    }
  }
  
  func sendNotification(launchIn: Double) {
    print("send local notification")
    let content = UNMutableNotificationContent()
    content.title = "How was your food?"
    content.body = "Add a review to your post!"
    content.sound = .default

      // A time interval trigger for demo purposes:
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: launchIn, repeats: false)
    
      // A calendar trigger could also work (but a longer demo):
      // var date = DateComponents()
      // date.hour = 10
      // date.minute = 25
      // let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: false)
    
    
    let request = UNNotificationRequest(identifier: "reminderNotification", content: content, trigger: trigger)
    
    
    UNUserNotificationCenter.current().add(request) { (error) in
      if error != nil {
        print(error)
        print("Error = \(error?.localizedDescription ?? "error local notification")")
      }
    }
    
  }
}
