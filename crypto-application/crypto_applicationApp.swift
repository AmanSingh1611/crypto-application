//
//  crypto_applicationApp.swift
//  crypto-application
//
//  Created by Aman on 24/10/25.
//

import SwiftUI

@main
struct crypto_applicationApp: App {
    @StateObject private var homeViewModel = HomeViewModel()
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
        UINavigationBar.appearance().tintColor = UIColor(Color.theme.accent)
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarBackButtonHidden()
            }
            .environmentObject(homeViewModel)
        }
    }
}
