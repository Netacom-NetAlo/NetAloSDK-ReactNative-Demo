//
//  NotificationService.swift
//  NotificationExtension
//
//  Created by Tran Phong on 8/16/21.
//

import UserNotifications

class NotificationService: UNNotificationServiceExtension {

    var contentHandler: ((UNNotificationContent) -> Void)?
    var bestAttemptContent: UNMutableNotificationContent?
  
    private lazy var notificationService = NetAloNotificationService(environment: .dev, appGroupIdentifier: BuildConfig.default.appGroupIdentifier)
  
    override func didReceive(_ request: UNNotificationRequest, withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
        self.contentHandler = contentHandler
        bestAttemptContent = (request.content.mutableCopy() as? UNMutableNotificationContent)
        
      if let bestAttemptContent = self.bestAttemptContent {
          notificationService.didReceive(bestAttemptContent) { (replaceContent) in
              if let replaceContent = replaceContent {
                  contentHandler(replaceContent)
              } else {
                  contentHandler(bestAttemptContent)
              }
          }
      } else {
          contentHandler(request.content)
      }
    }
    
    override func serviceExtensionTimeWillExpire() {
        // Called just before the extension will be terminated by the system.
        // Use this as an opportunity to deliver your "best attempt" at modified content, otherwise the original push payload will be used.
        if let contentHandler = contentHandler, let bestAttemptContent =  bestAttemptContent {
            contentHandler(bestAttemptContent)
        }
    }

}
