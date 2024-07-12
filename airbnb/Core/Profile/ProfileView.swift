//
//  ProfileView.swift
//  airbnb
//
//  Created by Eze Chidera Paschal on 09/07/2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            //profile
            VStack (alignment: .leading, spacing: 32) {
                VStack (alignment: .leading, spacing: 8) {
                    Text("Profile")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    
                    Text("Log in to start planning your next trip")
                }
                
                Button {
                    
                } label: {
                    Text("Log in")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 360, height: 48)
                        .background(.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                
                HStack {
                    Text("Don't have an account?")
                    
                    Text("Sign Up")
                        .fontWeight(.semibold)
                        .underline()
                }
                .font(.caption)
                
            }
            
            VStack (spacing: 24) {
                ProfileOptionRowView(imageName: "gear", title: "Settings")
                
                ProfileOptionRowView(imageName: "gear", title: "Accessibility")

                ProfileOptionRowView(imageName: "questionmark.circle", title: "Visit the help center")

            }
        }
        .padding()
    }
}

#Preview {
    ProfileView()
}
