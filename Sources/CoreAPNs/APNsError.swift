//
//  APNsError.swift
//  
//
//  Created by Jan Ruhlaender on 18.04.20.
//
import Foundation

public enum APNsError: Error {
    case invalidP8KeyFile(filePath: String)
    case signError
    case httpResponseError
}
