//
//  ContentView.swift
//  HoneyMoney
//
//  Created by ZHIWEN HUANG on 7/11/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var expenses: [Expense]
    @Query private var categories: [Category]
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Image(systemName: "wallet.pass")
                    Text("??")
                }
                .tag(0)
            
            StatisticsView()
                .tabItem {
                    Image(systemName: "chart.bar")
                    Text("??")
                }
                .tag(1)
            
            HistoryView()
                .tabItem {
                    Image(systemName: "clock")
                    Text("??")
                }
                .tag(2)
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("??")
                }
                .tag(3)
        }
        .accentColor(.blue)
        .onAppear {
            setupInitialData()
            setupTabBarAppearance()
        }
    }
    
    private func setupTabBarAppearance() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        
        // ????????????
        appearance.backgroundColor = UIColor(red: 1.0, green: 0.97, blue: 0.92, alpha: 0.95)
        
        // ????
        appearance.shadowColor = UIColor.black.withAlphaComponent(0.1)
        appearance.shadowImage = UIImage()
        
        // ?????????????
        appearance.stackedLayoutAppearance.selected.iconColor = UIColor(red: 0.2, green: 0.6, blue: 1.0, alpha: 1.0)
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [
            .foregroundColor: UIColor(red: 0.2, green: 0.6, blue: 1.0, alpha: 1.0)
        ]
        
        appearance.stackedLayoutAppearance.normal.iconColor = UIColor.systemGray
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [
            .foregroundColor: UIColor.systemGray
        ]
        
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    private func setupInitialData() {
        // ???????????????
        if categories.isEmpty {
            let defaultCategories = [
                Category(name: "??", icon: "fork.knife", color: "red"),
                Category(name: "??", icon: "car", color: "blue"),
                Category(name: "??", icon: "bag", color: "green"),
                Category(name: "??", icon: "gamecontroller", color: "yellow"),
                Category(name: "??", icon: "cross.case", color: "orange"),
                Category(name: "??", icon: "ellipsis.circle", color: "purple")
            ]
            
            for category in defaultCategories {
                modelContext.insert(category)
            }
            
            // ??????
            try? modelContext.save()
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: [Item.self, Expense.self, Category.self], inMemory: true)
}