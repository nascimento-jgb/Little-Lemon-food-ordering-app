//
//  Menu.swift
//  MyApp
//
//  Created by Joao Nascimento on 1.8.2023.
//

import SwiftUI

struct Menu: View {
    var body: some View {
        VStack{
            Text("Little Lemon Restaurant")
            Text("Helsinki")
            Text("Short description about the restaurant.")
            
            List{
                Text("Menu items will be displayed here")
            }
        }
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
