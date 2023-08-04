//
//  UserProfile.swift
//  MyApp
//
//  Created by Joao Nascimento on 1.8.2023.
//

import SwiftUI

struct UserProfile: View {
    
    @State private var profileName = UserDefaults.standard.string(forKey: kFirstName) ?? ""
    @State private var profileLastName = UserDefaults.standard.string(forKey: kLastName) ?? ""
    @State private var profileEmail = UserDefaults.standard.string(forKey: kEmail) ?? ""
    @State private var profilePhone = UserDefaults.standard.string(forKey: kPhone) ?? ""
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack{
            
            Text("Personal Information:").font(.custom("MarkaziText-Bold", size: 30))
                .padding(.leading, -100)
                .padding(.bottom, 5)
                .foregroundColor(.black)
            
            HStack{
                Text("Avatar").font(.custom("MarkaziText-SemiBold", size: 20))
                    .padding(.leading, -155)
                    .padding(.bottom, -20)
                    .foregroundColor(.gray)
            }
            
            HStack{
                Image("Profile")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height:100)
                    .padding()
                
                Spacer ()
                
                Button(action: {
                    
                }){
                    Text("Change")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color(red: 73/255, green: 94/255, blue: 87/255))
                        .cornerRadius(8)
                        .padding()
                } //Button
                
                Button(action: {
                    
                }){
                    Text("Delete")
                        .foregroundColor(Color(red: 73/255, green: 94/255, blue: 87/255))
                        .padding()
                        .background(.white)
                        .cornerRadius(8)
                        .border(Color(red: 73/255, green: 94/255, blue: 87/255), width: 1)
                }//Button
                Spacer()
            }
            .padding(.bottom, 25)
            
            ScrollView{
                Text("Name").font(.custom("MarkaziText-SemiBold", size: 20))
                    .padding(.leading, -165)
                    .padding(.bottom, -25)
                    .foregroundColor(.gray)
                
                TextField("", text: $profileName).font(.custom("MarkaziText-Regular", size: 20))
                    .padding(.vertical, 5)
                    .padding(.horizontal, 15)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                
                Text("Last Name").font(.custom("MarkaziText-SemiBold", size: 20))
                    .padding(.leading, -165)
                    .padding(.bottom, -25)
                    .foregroundColor(.gray)
                
                TextField("", text: $profileLastName).font(.custom("MarkaziText-Regular", size: 20))
                    .padding(.vertical, 5)
                    .padding(.horizontal, 15)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                
                Text("Email").font(.custom("MarkaziText-SemiBold", size: 20))
                    .padding(.leading, -165)
                    .padding(.bottom, -25)
                    .foregroundColor(.gray)
                
                TextField("", text: $profileEmail).font(.custom("MarkaziText-Regular", size: 20))
                    .padding(.vertical, 5)
                    .padding(.horizontal, 15)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Text("Phone Number").font(.custom("MarkaziText-SemiBold", size: 20))
                    .padding(.leading, -165)
                    .padding(.bottom, -25)
                    .foregroundColor(.gray)
                
                TextField("", text: $profilePhone).font(.custom("MarkaziText-Regular", size: 20))
                    .padding(.vertical, 5)
                    .padding(.horizontal, 15)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Text("Email Notification:").font(.custom("MarkaziText-SemiBold", size: 25))
                    .padding(.leading, -160)
                    .padding(.bottom, 5)
                    .foregroundColor(.black)
                
                HStack {
                    CheckboxView(title: "Discounts").id(1).font(.custom("MarkaziText-Regular", size: 22))
                    CheckboxView(title: "Order Status").id(2).font(.custom("MarkaziText-Regular", size: 22))
                    CheckboxView(title: "Newsletter").id(3).font(.custom("MarkaziText-Regular", size: 22))
                }
            }
                
            Button(action: {
                UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                    self.presentation.wrappedValue.dismiss()
                }){
                    Text("Logout")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color(red: 73/255, green: 94/255, blue: 87/255))
                        .cornerRadius(8)
                        
                } //Button
                
        }
//        .background(
//                    Image("Background2")
//                        .resizable()
//                        .frame(width: 400, height: 400)
//                        .edgesIgnoringSafeArea(.all)
//                )
    }
}

struct CheckboxView: View {
    @State private var isToggled = false
    var title: String

    var body: some View {
        Button(action: {
            isToggled.toggle()
        }) {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 20, height: 20)
                        .foregroundColor(isToggled ? Color(red: 73/255, green: 94/255, blue: 87/255) : .white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                    if isToggled {
                        Image(systemName: "checkmark")
                            .foregroundColor(.white)
                    }
                }
                Text(title)
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
