//
//  ContentView.swift
//  MigrateMate
//
//  Created by johnny basgallop on 13/12/2023.
//

import SwiftUI

var screenWidth = UIScreen.main.bounds.width
var screenHeight = UIScreen.main.bounds.height




struct ContentView: View {
    
    @AppStorage ("log_state") var log_state = false
    @State var Active_Search : Bool = false
    var body: some View {
        
        if log_state{
            Main(ActiveSearch: $Active_Search)
        }
        
        else if !log_state{
            SignUpScreen()
        }
    }
}

#Preview {
    ContentView()
}
