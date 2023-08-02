//
//  Onboarding.swift
//  MyApp
//
//  Created by Joao Nascimento on 1.8.2023.
//

import SwiftUI

let kFirstName: String = "first name key"
let kLastName: String = "last name key"
let kEmail: String = "email key"
let kIsLoggedIn: String = "kIsLoggedIn"

struct OnboardingView: View {
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    
    @State private var isShowingAlert = false
    @State var isLoggedIn = false
    
    var body: some View {
        
        NavigationStack{
            VStack{
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 360, height: 120)
                    .padding()
                
                Text("Welcome to Little Lemon App :)")
                    .padding()
                
                TextField("First Name:", text: $firstName)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 15)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Last Name:", text: $lastName)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 15)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Email:", text: $email)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 15)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .textCase(.lowercase)
                    
                
                Button(action: {
                    if !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty {
                        
                        if isValidEmail(email: email) {
                            UserDefaults.standard.set(firstName, forKey: kFirstName)
                            UserDefaults.standard.set(lastName, forKey: kLastName)
                            UserDefaults.standard.set(email, forKey: kEmail)
                            UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                            isLoggedIn = true
                           
                        } else {
                            isShowingAlert = true
                        }
                    } else {
                        isShowingAlert = true
                    }
                    
                }){
                    Text("Register")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color(red: 73/255, green: 94/255, blue: 87/255))
                        .cornerRadius(8)
                } //Button
                .padding(.vertical, 10)
            } //VStack
            .alert(isPresented: $isShowingAlert) {
                Alert(
                    title: Text("Error"),
                    message: Text("Please enter a valid email."),
                    dismissButton: .default(Text("OK"))
                )}
            
            .onAppear{
                if UserDefaults.standard.bool(forKey: kIsLoggedIn) {
                    isLoggedIn = true
                }
            }
            
            .navigationDestination(isPresented: $isLoggedIn) {
                Home().navigationBarBackButtonHidden(true)
            }
    } //NavigationStack
}
    
    func isValidEmail(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
        }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
