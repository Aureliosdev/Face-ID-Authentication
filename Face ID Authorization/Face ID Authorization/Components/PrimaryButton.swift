//
//  PrimaryButton.swift
//  Face ID Authorization
//
//  Created by Aurelio Le Clarke on 18.10.2022.
//

import SwiftUI

struct PrimaryButton: View {
    var image: String?
    var showImage = true
    var text: String
    
    var body: some View {
        HStack {
            if showImage {
                Image(systemName: image ?? "person.fill")
            }
            Text(text)
        }
        .padding()
        .padding(.horizontal)
        .background(Color(.systemBackground))
        .cornerRadius(30)
        .shadow(radius: 6)
        
    }
    
}
struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(image: "faceid", text: "Login with Face ID")
    }
}
