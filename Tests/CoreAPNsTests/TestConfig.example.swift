//
//  TestConfig.example.swift
//  
//
//  Created by Jan Ruhlaender on 24.04.20.
//

import Foundation

/// TODO: Rename this file to TestConfig
class TestConfigExample {

    // MARK: - Required information to create an access token for the APNs Service

    /// the TEAM-ID Must be set and is used as issuer of the notification.
    static let teamID     = "YOUR_TEN_LETTER_TEAM_ID"

    // Your Key-ID. See: Apple Developer Account / Certificates, Identifiers & Profiles / Keys
    static let keyID      = "YOUR_10_LETTER_KEY_ID"

    // Your Key-File. Must be created and downloaded. See: Apple Developer Account / Certificates, Identifiers & Profiles / Keys
    // IMPORTANT: This file path must not be located in a protected directory like Downloads
    static let p8FilePath = "LOCAL_PATH/AuthKey_<KEY-ID>.p8"

    // MARK: - required information to create a notification

    // This identifier must be created by the app. See: https://stackoverflow.com/questions/25925481/how-to-get-a-unique-device-id-in-swift
    static let deviceID    = "YOUR_DEVICE_ID"

    // Application Bundle Identifier from your App. See: Project / Target / General / Bundle Identifier
    static let appBundleID = "YOUR_APP_BUNDLE_ID"

    // Payload of the notification
    static let payload     = "{\"aps\":{\"alert\":\"Test\"},\"yourCustomKey\":\"1\"}"
}
