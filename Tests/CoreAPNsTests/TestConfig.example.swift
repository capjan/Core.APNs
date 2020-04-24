//
//  TestConfig.example.swift
//  
//
//  Created by Jan Ruhlaender on 24.04.20.
//

import Foundation

/// TODO: Rename this file to TestConfig
class TestConfigExample {

    /// the TEAM-ID Must be set and is used as issuer of the notification.
    static let teamID     = "YOUR_TEN_LETTER_TEAM_ID"

    // Your Key-ID. See: Apple Developer Account / Certificates, Identifiers & Profiles / Keys
    static let keyID      = "YOUR_10_LETTER_KEY_ID"

    // Your Key-File. Must be created and downloaded. See: Apple Developer Account / Certificates, Identifiers & Profiles / Keys
    // IMPORTANT: This file path must not be located in a protected directory like Downloads
    static let p8FilePath = "LOCAL_PATH/AuthKey_<KEY-ID>.p8"
}
