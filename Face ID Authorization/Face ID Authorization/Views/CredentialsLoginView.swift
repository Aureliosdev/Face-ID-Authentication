//
//  CredentialsLoginView.swift
//  Face ID Authorization
//
//  Created by Aurelio Le Clarke on 19.10.2022.
//

import SwiftUI

struct CredentialsLoginView: View {
    @EnvironmentObject var authenticationManager: AuthenticationManager
    
    @State private  var userName = ""
    @State private  var password = ""
    
    var body: some View {
        VStack(spacing: 40) {
            Title()
            TextField("Username",text: $userName)
            
            SecureField("Password", text: $password)
            
            PrimaryButton(showImage: false, text: "Login")
                .onTapGesture {
                    authenticationManager.authenticateWithCredentials(username: userName, password: password)
                }
                
        }
        .textFieldStyle(.roundedBorder)
        .padding()
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(LinearGradient(colors: [.blue,.purple], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

struct CredentialsLoginView_Previews: PreviewProvider {
    static var previews: some View {
        CredentialsLoginView()
            .environmentObject(AuthenticationManager())
    }
}
