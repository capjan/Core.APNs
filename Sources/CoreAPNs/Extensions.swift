//
//  Extensions.swift
//  
//
//  Created by Jan Ruhlaender on 23.04.20.
//

import Foundation

extension APNsNotification {

    func toUrlRequest() -> URLRequest {
        let url = server.url.appendingPathComponent("/3/device/\(deviceID)")
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: 10)
        request.httpMethod = "POST"
        request.httpBody = payload.data(using: .utf8)
        request.addValue("bearer \(accessToken.value)", forHTTPHeaderField: "authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue(id.uuidString.lowercased(), forHTTPHeaderField: "apns-id")
        request.addValue("alert", forHTTPHeaderField: "apns-push-type")
        request.addValue("0", forHTTPHeaderField: "apns-expiration")
        request.addValue("\(priority.value)", forHTTPHeaderField: "apns-priority")
        request.addValue(appBundleID, forHTTPHeaderField: "apns-topic")
        return request
    }
}

extension APNsClient {

    func notify(result: APNsPushResult) {
        self.pushPublisher.send(result)
    }

    func notifyFailure(id: UUID, message: String) {
        self.notify(result: APNsPushResult(success: false, errorMessage: message, notificationID: id))
    }

    func notifyFailure(id: UUID, error: Error) {
        self.notify(result: APNsPushResult(success: false, errorMessage: error.localizedDescription, notificationID: id))
    }

    func notifySuccess(id: UUID) {
        self.notify(result: APNsPushResult(success: true, errorMessage: "", notificationID: id))
    }

}
