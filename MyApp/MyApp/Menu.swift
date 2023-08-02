//
//  Menu.swift
//  MyApp
//
//  Created by Joao Nascimento on 1.8.2023.
//

import SwiftUI

struct Menu: View {
    
    func getMenuData() {
        let serverUrl: String = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
        
        guard let url = URL(string: serverUrl) else {
            //handle error
            return
        }
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                print("Error: \(error).")
            } else if let data = data {
                if let decodedMenuList = try? JSONDecoder().decode(MenuList.self, from: data) {
                    print("Decoded Menu List: \(decodedMenuList)")
                } else {
                    print("Unable to decode")
                }
            }
            
        }
        task.resume()
    }
    
    var body: some View {
        VStack{
            Text("Little Lemon Restaurant")
            Text("Helsinki")
            Text("Short description about the restaurant.")
            
            List{
                Text("Menu items will be displayed here")
            }
        }
        .onAppear {
            getMenuData()
        }
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
