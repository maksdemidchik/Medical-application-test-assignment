//
//  tabBarView.swift
//  TestAssignment
//
//  Created by Maxim on 16.09.2025.
//
import SwiftUI
struct TabBarView:View {
    
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(Color.white)
        
    }
    var body: some View {
        ZStack{
            TabView{
                DoctorListView().tabItem{
                    Label("Главная",image: "House")
                }
                
                Image("calendar").tabItem {
                    Label("Приёмы", image: "calendar")
                }
                Image("Chat").tabItem {
                    Label("Чат", image: "Chat")
                }
                Image("Profile").tabItem {
                    Label("Профиль", image: "Profile")
                }
            }
        }
        
    }
}

#Preview {
    TabBarView()
}
