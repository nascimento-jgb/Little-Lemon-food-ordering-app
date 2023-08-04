//
//  HeaderView.swift
//  MyApp
//
//  Created by Joao Nascimento on 3.8.2023.
//

import SwiftUI

struct HeaderView: View {
    @State private var isLoggedIn = UserDefaults.standard.bool(forKey: kIsLoggedIn)
    
    var body: some View {
        HStack(spacing: 60){
                   if isLoggedIn {
                       Spacer()
                   }
                   
                   Image("Logo")
                       .resizable()
                       .scaledToFit()
                       .frame(width: 150, height: 50)
                   
                   if isLoggedIn {
                       Image("Profile")
                           .resizable()
                           .scaledToFit()
                           .frame(width: 65, height: 50)
                   }
               }
           }
        }


struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
