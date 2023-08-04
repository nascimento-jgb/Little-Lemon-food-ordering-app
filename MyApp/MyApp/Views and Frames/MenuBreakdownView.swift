//
//  MenuBreakdownView.swift
//  MyApp
//
//  Created by Joao Nascimento on 4.8.2023.
//

import SwiftUI

struct MenuBreakdownView: View {
    var body: some View {
        VStack{
            
            HStack{
                Text("ORDER FOR DELIVERY!").font(.custom("MarkaziText-Bold", size: 22))
                
                Image("Delivery van")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
            }
            .padding(.bottom, -5)
            
            HStack{
                
                Button(action: {
                    
                    }){
                        Text("Starters").font(.custom("MarkaziText-SemiBold", size: 22))
                            .foregroundColor(.white)
                            .padding(10)
                            .background(Color(red: 73/255, green: 94/255, blue: 87/255))
                            .cornerRadius(10)
                            .frame(height: 50)
                    }//Button
                
                Button(action: {
                    
                    }){
                        Text("Main").font(.custom("MarkaziText-SemiBold", size: 22))
                            .foregroundColor(.white)
                            .padding(10)
                            .background(Color(red: 73/255, green: 94/255, blue: 87/255))
                            .cornerRadius(8)
                            
                    } //Button
                
                Button(action: {
                    
                    }){
                        Text("Desserts").font(.custom("MarkaziText-SemiBold", size: 22))
                            .foregroundColor(.white)
                            .padding(10)
                            .background(Color(red: 73/255, green: 94/255, blue: 87/255))
                            .cornerRadius(8)
                            
                    } //Button
                
                Button(action: {
                    
                    }){
                        Text("Drinks").font(.custom("MarkaziText-SemiBold", size: 22))
                            .foregroundColor(.white)
                            .padding(10)
                            .background(Color(red: 73/255, green: 94/255, blue: 87/255))
                            .cornerRadius(8)
                            
                    } //Button
                
            }
            Divider()
        }
    }
}

struct MenuBreakdownView_Previews: PreviewProvider {
    static var previews: some View {
        MenuBreakdownView()
    }
}
