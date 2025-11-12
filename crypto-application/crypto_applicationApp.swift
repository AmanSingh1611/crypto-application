//
//  crypto_applicationApp.swift
//  crypto-application
//
//  Created by Aman on 24/10/25.
//

import SwiftUI

@main
struct crypto_applicationApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarBackButtonHidden()
            }
        }
    }
}
