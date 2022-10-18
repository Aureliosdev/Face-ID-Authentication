//
//  AuthenticationManager.swift
//  Face ID Authorization
//
//  Created by Aurelio Le Clarke on 18.10.2022.
//

import Foundation
import LocalAuthentication


class  AuthenticationManager: ObservableObject {
    private(set) var context = LAContext()
    
    @Published private(set) var biometryType: LABiometryType = .none
    private(set) var canEvaluatePolicy = false
    @Published private(set) var isAuthenticated = false
    @Published private(set) var errorDescription: String?
    @Published var showAlert = false
    
    
    init() {
        getbiometryType()
    }
    
    func getbiometryType() {
        canEvaluatePolicy =  context.canEvaluatePolicy( .deviceOwnerAuthenticationWithBiometrics, error: nil)
        biometryType = context.biometryType
        
    }
    
    func authenticateWithBiometrics() async {
        context = LAContext()
        
        if canEvaluatePolicy {
            let reason =  "Log into your account"
            do {
                let succes =  try await context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason)
                if succes {
                    DispatchQueue.main.async {
                        self.isAuthenticated = true
                        print("isAuthenticated \(self.isAuthenticated)")
                    }
                }
            }catch {
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.errorDescription = error.localizedDescription
                    self.showAlert = true
                    self.biometryType = .none
                }
            }
        }
    }
    func authenticateWithCredentials(username: String, password: String) {
        if username.lowercased() == "abylay" && password == "qwerty" {
            isAuthenticated = true
        }else {
            errorDescription = "Wrong credentials"
            showAlert = true
        }
    }
    func logOut() {
        isAuthenticated = false
    }
}
