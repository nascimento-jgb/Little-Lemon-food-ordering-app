//
//  Home.swift
//  MyApp
//
//  Created by Joao Nascimento on 1.8.2023.
//

import SwiftUI

struct Home: View {
    let customPersistence = CustomPersistenceController.shared
    
    @State private var isHeroViewVisible = true
    
    var body: some View {
        VStack {
            HStack{
                HeaderView()
            }
            
            if isHeroViewVisible {
                HeroView()
                    .padding(.bottom, -12)
            }
            
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
                    .tag(1)
                    .onAppear {
                        isHeroViewVisible = false
                    }
                    .onDisappear {
                        isHeroViewVisible = true
                    }
            }
            .edgesIgnoringSafeArea(.top)
            
        }
//        .edgesIgnoringSafeArea(.top)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
