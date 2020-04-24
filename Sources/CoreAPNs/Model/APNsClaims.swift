//
//  APNsClaims.swift
//  
//
//  Created by Jan Ruhlaender on 17.04.20.
//
import SwiftJWT


/// APNs Claims for the JSON Web Token (JWT)
struct APNsClaims: Claims {

    /// Issuer of the Token. e.g. the TeamID of the used Apple Developer Account. See: Developer Account / Membership
    public var issuer: String

    /// Issued at Time as seconds since epoch
    public var issuedAt: Int64

    public enum CodingKeys: String, CodingKey {
        case issuer = "iss"
        case issuedAt = "iat"
    }
}
