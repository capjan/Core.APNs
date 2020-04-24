//
//  APNsPushResult.swift
//  
//
//  Created by Jan Ruhlaender on 23.04.20.
//

import Foundation

public struct APNsPushResult {
    public let success: Bool
    public let errorMessage: String
    public let notificationID: UUID
}
