//
//  HeroView.swift
//  MyApp
//
//  Created by Joao Nascimento on 3.8.2023.
//

import SwiftUI

struct HeroView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color(red: 73/255, green: 94/255, blue: 87/255))
                .frame(width: UIScreen.main.bounds.width, height: 250)

            HStack(alignment: .center, spacing: 20) {
                VStack(alignment: .leading, spacing: 0) {
                    
                       Text("Little Lemon").font(.custom("MarkaziText-Bold", size: 47))
                           .font(.largeTitle)
                           .foregroundColor(.yellow)
                           .padding(.bottom, -7)
                    
                    Text("Helsinki").font(.custom("MarkaziText-SemiBold", size: 37))
                           .font(.headline)
                           .foregroundColor(.white)
                           .padding(4)
                           .padding(.bottom, 5)

                       Text("We are a family owned Mediterranean restaurant, focused on traditional recipes with modern twist.").font(.custom("MarkaziText-Regular", size: 20))
                           .foregroundColor(.white)
                           .multilineTextAlignment(.leading)
                           .frame(width: 180)
                           .lineLimit(nil)
                           .padding(5)

                   }
                
                Spacer()
                    .overlay{
                        Image("Hero image")
                            .resizable()
//                            .scaledToFit()
                            .frame(width: 130, height: 200)
                            .cornerRadius(15)
//                            .padding(.trailing, 0)
                            .padding(.bottom, -25)
                    }
            }
            .padding()
        }

    }
}


struct HeroView_Previews: PreviewProvider {
    static var previews: some View {
        HeroView()
    }
}
