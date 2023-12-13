//
//  SignUpScreen.swift
//  BarkLog
//
//  Created by johnny basgallop on 10/12/2023.
//

import SwiftUI
import AuthenticationServices

struct SignUpScreen: View {
    
    @AppStorage ("log_state") var log_state = false
    @StateObject var signInViewModel = SignInViewModel()
    
    var body: some View {
        VStack{
            
            TitleLogo().offset(x: screenWidth *  0.05, y: screenHeight * 0.02)
            
            Image("MigrateMateIllustration")
                .resizable()
                .frame(width: screenWidth * 0.7, height: screenWidth * 0.7).offset(x:0,y: screenHeight * 0.1)
            
            
            
            Text("Helping you find a new city to love... ").font(.title).fontWeight(.semibold).frame(width: screenWidth * 0.7).offset(x:0,y: screenHeight * 0.18).foregroundColor(Color("PrimaryCol"))
            
            Spacer()
            
            SignInWithAppleButton {request in
                signInViewModel.SignInWithAppleRequest(request)
            } onCompletion: { result in
                signInViewModel.SignInWithAppleCompletion(result)
            }.frame(width: 300, height: 50).cornerRadius(10).offset(y: -screenHeight * 0.03)
        }
        .onAppear{
            print("signup appeard")
        }
    }
}


struct TitleLogo : View {
    var body: some View {
        HStack{
            Text("MigrateMate").font(.title).fontWeight(.bold).foregroundColor(Color("PrimaryCol"))
            
            Image("MagpieIcon").resizable()
                .frame(width: screenWidth * 0.1, height: screenWidth * 0.1).offset(x: -screenWidth * 0.02)
        }
    }
}

#Preview {
    SignUpScreen()
       
}
