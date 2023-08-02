//
//  Home.swift
//  MyApp
//
//  Created by Joao Nascimento on 1.8.2023.
//

import SwiftUI

struct Home: View {
    let customPersistence = CustomPersistenceController.shared
    
    var body: some View {
        
        TabView{
            Menu()
                .environment(\.managedObjectContext, customPersistence.container.viewContext)
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
