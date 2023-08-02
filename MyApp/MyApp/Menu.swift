//
//  Menu.swift
//  MyApp
//
//  Created by Joao Nascimento on 1.8.2023.
//

import SwiftUI
import CoreData

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Dish.entity(), sortDescriptors: []) private var dishes: FetchedResults<Dish>
    
    func clearDatabase() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = Dish.fetchRequest()

        do {
            let dishes = try viewContext.fetch(fetchRequest)
            for dish in dishes {
                viewContext.delete(dish as! NSManagedObject)
            }
        } catch {
            print("Failed to fetch Dish objects")
        }
    }
    
    func getMenuData() {
        clearDatabase()
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
                do {
                    let decodedMenuList = try JSONDecoder().decode(MenuList.self, from: data)
                    print("Decoded Menu List: \(decodedMenuList)")
                    
                    for decodedMenuItem in decodedMenuList.menu {
                        let dish = Dish(context: viewContext)
                        
                        dish.id = Int64(decodedMenuItem.id)
                        dish.title = decodedMenuItem.title
                        dish.itemDescription = decodedMenuItem.itemDescription
                        dish.price = decodedMenuItem.price
                        dish.image = decodedMenuItem.image
                        dish.category = decodedMenuItem.category
                    }
                    
                    do {
                        try viewContext.save()
                    } catch {
                        let nserror = error as NSError
                        fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
                    }

                } catch {
                    print("Unable to decode")
                }
            }
        }
        task.resume()
    }
    
    var body: some View {
//        @FetchRequest(
//                entity: Dish.entity(),
//                sortDescriptors: [NSSortDescriptor(keyPath: \Dish.title, ascending: true)]
//            ) var dishes: FetchedResults<Dish>
        
        VStack{
            Text("Little Lemon Restaurant")
            Text("Helsinki")
            Text("Short description about the restaurant.")
            
//            List {
//                ForEach(dishes, id: \.self) { dish in
//                    HStack{
//                        Text(String(describing: "\(dish.title ?? "") - \(dish.itemDescription ?? "")"))
//
//                        if let dishImage = dish.image {
//                            AsyncImage(url: URL(string: dishImage)) {image in
//                                image.resizable().scaledToFit()
//                            } placeholder: {
//                                ProgressView()
//                            }
//                        }
//                    }
//                }
//            }
            List(dishes, id: \.self) { dish in
                HStack {
                    Text("\(dish.title ?? "") - \(dish.itemDescription ?? "")")
                            
                    AsyncImage(url: URL(string: dish.image ?? "")) { image in
                            image.resizable().scaledToFit().frame(width: 50, height: 50)
                        } placeholder: {
                            ProgressView()
                        }
                    }
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
