//
//  ContentView.swift
//  Face ID Authorization
//
//  Created by Aurelio Le Clarke on 18.10.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var authenticationManager = AuthenticationManager()
    
    var body: some View {
        NavigationView {
            VStack {
                if authenticationManager.isAuthenticated {
                    VStack(spacing: 40) {
                       
                        Text("Welcome to project")
                            .foregroundColor(.white)
                            .font(.title)
                         
                        PrimaryButton(showImage: false, text: "Logout")
                            .onTapGesture {
                                authenticationManager.logOut()
                            }
                        
                    }
                    .frame(maxWidth: .infinity,maxHeight: .infinity)
                    .background(LinearGradient(colors: [.blue,.purple], startPoint: .topLeading, endPoint: .bottomTrailing))
                } else {
                    LoginView()
                        .environmentObject(authenticationManager)
                       
                }
                 
            }
        
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            .alert(isPresented: $authenticationManager.showAlert) {
                Alert(title: Text("Error"),message: Text(authenticationManager.errorDescription ?? "error to trying login with credentials,please try again"),dismissButton: .default(Text("Ok")))
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
