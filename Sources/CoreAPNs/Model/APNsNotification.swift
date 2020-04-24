//
//  APNsPushNotification.swift
//  
//
//  Created by Jan Ruhlaender on 23.04.20.
//

import Foundation

public struct APNsNotification {
    public let id = UUID()
    public let server: APNsServer
    public let accessToken: APNsAccessToken
    public let deviceID: String
    public let appBundleID: String
    public let priority: APNsPriority
    public let payload: String

    public init(server: APNsServer, accessToken: APNsAccessToken, deviceID: String, appBundleID: String, payload: String, priority: APNsPriority = .immediately) {
        self.server = server
        self.accessToken = accessToken
        self.deviceID = deviceID
        self.appBundleID = appBundleID
        self.payload = payload
        self.priority = priority
    }
}
