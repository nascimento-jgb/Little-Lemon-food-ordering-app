//
//  Home.swift
//  MyApp
//
//  Created by Joao Nascimento on 1.8.2023.
//

import SwiftUI

struct Home: View {
    var body: some View {
        
        TabView{
            Menu()
                .tabItem({
                    Label("Menu", systemImage: "list.dash")
                })
            
            UserProfile()
                .tabItem({
                    Label("Profile", systemImage: "square.and.pencil")
                })
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}