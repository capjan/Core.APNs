import XCTest
import Combine
@testable import CoreAPNs

final class CoreAPNsTests: XCTestCase {

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        do {

            // required data to create an access token for the APN Service
            let keyID = TestConfig.keyID
            let teamID = TestConfig.teamID
            let p8FilePath = TestConfig.p8FilePath

            // required data to create a notification
            let deviceToken = TestConfig.deviceID
            let appBundleID = TestConfig.appBundleID
            let payload = TestConfig.payload

            // create an access token to push notifications
            let accessToken = try APNsAccessToken(keyID: keyID, teamID: teamID, p8FilePath: p8FilePath)

            XCTAssertTrue(accessToken.value.count > 0)

            // create a notification
            let myNotification = APNsPushNotification(server: .sandbox,
                                                    accessToken: accessToken,
                                                    deviceID: deviceToken,
                                                    appBundleID: appBundleID,
                                                    priority: .immediately,
                                                    payload: payload)

            // create a client
            let client = APNsClient()


            let expection = self.expectation(description: "client has pushed a notification")
            let cancelToken = client.pushPublisher.sink { result in
                if (result.notificationID == myNotification.id) {
                    expection.fulfill()
                }
            }

            client.enqueue(notification: myNotification)

            waitForExpectations(timeout: 5) { optionalError in
                cancelToken.cancel()
            }




        }  catch {
            XCTAssert(false, "failed to create an access Token: \(error)")            
        }
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
