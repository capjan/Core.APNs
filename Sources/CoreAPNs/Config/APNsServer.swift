//
//  APNsServer.swift
//  
//
//  Created by Jan Ruhlaender on 17.04.20.
//
import Foundation

public struct APNsServer {

    public static let sandbox = APNsServer(url: URL(string: "https://api.sandbox.push.apple.com:443")!)
    public static let production = APNsServer(url: URL(string: "https://api.push.apple.com:443")!)

    public let url: URL
}
