//
//  Main.swift
//  MigrateMate
//
//  Created by johnny basgallop on 13/12/2023.
//

import SwiftUI

struct Main: View {
    @AppStorage ("log_state") var log_state = false
    var body: some View {
        VStack{
            HStack{
             LogoutButton()
                Spacer()
                
            TitleLogo()
                
               Spacer()
                
                
            }.padding()
            Spacer()
        }
    }
}

struct LogoutButton : View {
    @State var logoutAlertShowing: Bool = false
    @AppStorage ("log_state") var log_state = false
    var body: some View {
        Button(
            action: {
                logoutAlertShowing = true
            }, label: {
                Image(systemName: "rectangle.portrait.and.arrow.right")
                    .font(.system(size: 25))
                    .foregroundColor(Color("PrimaryCol"))
            })
        
        .alert(isPresented: $logoutAlertShowing) {
                   Alert(
                    title: Text("Logout of account"),
                    message: Text("By confirming you will logout of your MigrateMate account"),
                       primaryButton: .default(Text("Logout")) {
                           
                           log_state = false
                           
                          logoutAlertShowing = false
                       },
                       secondaryButton: .cancel(Text("Cancel")) {
                           logoutAlertShowing = false
                       }
                   )
               }
    }
}

#Preview {
    Main()
}
