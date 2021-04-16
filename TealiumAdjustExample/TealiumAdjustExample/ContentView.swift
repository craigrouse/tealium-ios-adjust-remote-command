//
//  ContentView.swift
//  TealiumAdjustExample
//
//  Created by Christina S on 2/12/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            EventsView()
                .tabItem {
                    Label("Events", systemImage: "sparkle")
                }
            InAppPurchasesView()
                .tabItem {
                    Label("In-App Purchases", systemImage: "purchased.circle.fill")
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
        }.accentColor(.tealBlue).onOpenURL(perform: { url in
            TealiumHelper.trackEvent(title: "track_deeplink",
                                     data: ["deeplink_url": url.absoluteString])
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
