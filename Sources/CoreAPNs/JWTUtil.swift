//
//  JWTUtil.swift
//  
//
//  Created by Jan Ruhlaender on 23.04.20.
//

import Foundation
import SwiftJWT

class JWTUtil {

    static func createAccessToken(keyID: String, teamID: String, issuedAt: Date, privateKey: Data) throws -> String {
        var webToken = JWTUtil.createWebToken(keyID: keyID, teamID: teamID, issuedAt: issuedAt)
        let signer = JWTSigner.es256(privateKey: privateKey)

        guard let tokenString = try? webToken.sign(using: signer) else {
            throw APNsError.signError
        }
        return tokenString
    }


    static func createWebToken(
        keyID: String,
        teamID: String,
        issuedAt: Date
    ) -> JWT<APNsClaims> {

        let header = Header(typ: nil, kid: keyID)
        let secondsSinceEpoch = Int64(issuedAt.timeIntervalSince1970)
        let claims = APNsClaims(issuer: teamID, issuedAt: secondsSinceEpoch)
        return JWT(header: header, claims: claims)
    }

}
