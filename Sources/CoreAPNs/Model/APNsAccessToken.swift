//
//  AccessToken.swift
//  
//
//  Created by Jan Ruhlaender on 17.04.20.
//
import Foundation

/// This JWT Bearer token is required to access the APN Service
public struct APNsAccessToken {

    /// String representation of the Bearer Access token
    public let value: String

    /// Creates a new Instance from a given bearer access token
    /// - Parameter string: content of the bearer access token
    init(tokenValue string: String) {
        value = string
    }

    /// Creates a new instance
    /// - Parameters:
    ///   - keyID: key of the private key that is required to sign the access token
    ///   - teamID: id of the development team. See Apple Developer Account / Membership
    ///   - privateKey: p8 private key Data
    ///   - issuedAt: Time at which this token was created
    /// - Throws: APNsError.signError
    public init(keyID: String, teamID: String, privateKey: Data, issuedAt: Date = Date()) throws {
        value = try JWTUtil.createAccessToken(keyID: keyID, teamID: teamID, issuedAt: issuedAt, privateKey: privateKey)
    }


    /// Creates a new AccessToken Instance
    /// - Parameters:
    ///   - keyID: key of the private key that is required to sign the access token
    ///   - teamID: id of the development team. See: Apple Developer Account / Membership
    ///   - p8FilePath: filepath to the private key
    ///   - issuedAt: Time at which this token was created
    /// - Throws: APNsError.invalidP8KeyFile
    init (keyID: String, teamID: String, p8FilePath: String, issuedAt: Date = Date()) throws {
        let url = URL(fileURLWithPath: p8FilePath)
        guard let p8PrivateKey = try? Data(contentsOf: url) else {
            throw APNsError.invalidP8KeyFile(filePath: p8FilePath)
        }
        self = try APNsAccessToken(keyID: keyID, teamID: teamID, privateKey: p8PrivateKey, issuedAt: issuedAt)
    }

}
