//
//  BuildConfig.swift
//  NotificationExtension
//
//  Created by Tran Phong on 8/17/21.
//

import Foundation

struct BuildConfig {
    var appGroupIdentifier: String
    // TODO: Re-config this if env changed
    static var `default` = BuildConfig(appGroupIdentifier: "group.vn.netacom.netalo-dev")
    static var dev = BuildConfig(appGroupIdentifier: "group.com.wellspring.carptech.onesignal")
    static var prod = BuildConfig(appGroupIdentifier: "group.com.wellspring.carptech.onesignal")
}
