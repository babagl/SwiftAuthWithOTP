//
//  CustomTabView.swift
//  CustomMenu_Side (iOS)
//
//  Created by Balaji on 10/12/21.
//

import SwiftUI

struct CustomTabView: View {
    @Binding var currentTab: String
    @Binding var showMenu: Bool
    
    var body: some View {
        
        VStack{
            // Static Header View for all Pages...
            HStack{
                
                // Menu Button...
                Button {
                    // Toggling Menu Option...
                    withAnimation(.spring()){
                        showMenu = true
                    }
                } label: {
                    
                    Image(systemName: "line.3.horizontal.decrease")
                        .font(.title2)
                        .foregroundColor(.black)
                }
                // Hidinig When Menu is Visible...
                .opacity(showMenu ? 0 : 1)
                
                Spacer()
                
                Button {
                    
                } label: {
                    
                    Image("Omoney")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 35, height: 35)
                        .cornerRadius(5)
                }


            }
            // Page Title...
            .overlay(
            
                Text(currentTab)
                    .font(.title2.bold())
                    .foregroundColor(Color("OrangeM"))
                // Same Hiding When Menu is Visible...
                    .opacity(showMenu ? 0 : 1)
            )
            .padding([.horizontal,.top])
            .padding(.bottom,8)
            .padding(.top,getSafeArea().top)
            
            TabView(selection: $currentTab) {
                
                Home()
                    .tag("Accueil")
                
                // Replace Your Custom Views here...
                Text("Services")
                    .tag("Services")
                
                Text("Devices")
                    .tag("Devices")
                
                Text("Profil")
                    .tag("Profil")
                
                Text("Parametre")
                    .tag("Parametre")
                
                Text("About")
                    .tag("About")
                
                Text("Help")
                    .tag("Help")
                
                
            }
        }
        // Disabling actions when menu is visible...
        .disabled(showMenu)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay(
        
            // Close Button...
            Button {
                // Toggling Menu Option...
                withAnimation(.spring()){
                    showMenu = false
                }
            } label: {
                
                Image(systemName: "xmark")
                    .font(.title2)
                    .foregroundColor(.black)
            }
            // Hidinig When Menu is Visible...
            .opacity(showMenu ? 1 : 0)
            .padding()
            .padding(.top)
            
            ,alignment: .topLeading
        )
        .background(
        
            Color.white
        )
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
