//
//  APNsClient.swift
//
//
//  Created by Jan Ruhlaender on 17.04.20.
//
import Foundation
import SwiftJWT
import Combine


/// A simple client to push notifications
public class APNsClient {

    private var dataTask: URLSessionDataTask?
    private var notificationQueue = [APNsNotification]()

    public var pushPublisher = PassthroughSubject<APNsPushResult, Never>()

    private(set) var isBusy: Bool = false

    public func enqueue(notification: APNsNotification) {
        notificationQueue.append(notification)
        progressQueue()
    }

    private func progressQueue(ignoreBusy: Bool = false) {
        guard ignoreBusy || isBusy == false else { return }
        guard !notificationQueue.isEmpty else {
            isBusy = false
            return
        }

        push(notificationQueue.removeFirst())
    }

    private func push(_ notification: APNsNotification) {

        let request = notification.toUrlRequest()
        let session = URLSession(configuration: .default)

        dataTask = session.dataTask(with: request) { data, optionalResponse, error in

            // ensure cleaning up the transmission
            defer {
                self.dataTask = nil
                self.progressQueue(ignoreBusy: true)
            }

            // forward all possible URLSession errors
            guard error == nil else {
                self.notifyFailure(id: notification.id, error: error!)
                return
            }

            // validate post response
            guard
                let response = optionalResponse as? HTTPURLResponse,
                200..<300 ~= response.statusCode,
                let apnsId = response.value(forHTTPHeaderField: "apns-id"),
                notification.id == UUID(uuidString: apnsId)
            else {
                self.notifyFailure(id: notification.id, error: APNsError.httpResponseError)
                return
            }

            // Houston, we have a successful transmission
            self.notifySuccess(id: notification.id)

        }
        // Start download
        dataTask?.resume()
    }

}


