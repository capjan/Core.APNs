//
//  APNsPriority.swift
//  
//
//  Created by Jan Ruhlaender on 23.04.20.
//

import Foundation

public struct APNsPriority {

    public static let immediately = APNsPriority(value: 10)
    public static let background = APNsPriority(value: 5)
    
    public let value: Int
}
