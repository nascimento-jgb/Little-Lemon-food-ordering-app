//
//  UserProfile.swift
//  MyApp
//
//  Created by Joao Nascimento on 1.8.2023.
//

import SwiftUI

struct UserProfile: View {
    
    let profileName = UserDefaults.standard.string(forKey: kFirstName)
    let profileLastName = UserDefaults.standard.string(forKey: kLastName)
    let profileEmail = UserDefaults.standard.string(forKey: kEmail)
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack{
            Text("Personal Information")
                .padding()
            
            Image("Profile")
            
            Text(profileName ?? "")
                .padding()
            
            Text(profileLastName ?? "")
                .padding()
            
            Text(profileEmail ?? "")
                .padding()
            
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
            Spacer()
        }
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
