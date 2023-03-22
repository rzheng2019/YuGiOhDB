//
//  YuGiOhDBApp.swift
//  YuGiOhDB
//  Description: App demonstrates the knowledge of networking by decoding a public Yu-Gi-Oh API
//  found at URL: https://db.ygoprodeck.com/api/v7/cardinfo.php by grabbing data for each card
//  by and displaying it's details in a navigation view.
//  Created by Ricky Zheng on 1/19/23.
//

import SwiftUI

@main
struct YuGiOhDBApp: App {
    var body: some Scene {
        WindowGroup {
            YuGiOhContentView()
        }
    }
}
