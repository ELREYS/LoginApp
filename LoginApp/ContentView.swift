//
//  ContentView.swift
//  LoginApp
//
//  Created by MMBBS0000 on 20.04.20.
//  Copyright © 2020 gditdev. All rights reserved.
//

import SwiftUI

let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0,
                           opacity: 1.0)


struct ContentView: View {
    
    @State var userName = ""
    @State var password = ""
    var body: some View {
        VStack {
            WelcomeText()
            UserImage()
            VStack {
                TextField("Username", text:$userName)
                    .padding()
                    .background(lightGreyColor)
                    .cornerRadius(5.0)
                    .padding(.bottom,20)
                SecureField("Password", text:$password)
                    .padding()
                    .background(lightGreyColor)
                    .cornerRadius(5.0)
                    .padding(.bottom,20)
                Button(action: {print("Login Button clicked")}){
                LoginButtonContent()
                }
                
            }.padding()
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct UserImage: View {
    var body: some View {
        Image("userImage")
            .resizable()
            .aspectRatio(contentMode:.fill)
            .frame(width: 150, height: 150)
            .clipped()
            .cornerRadius(150)
            .padding(.bottom,75)
    }
}

struct WelcomeText: View {
    var body: some View {
        Text("Welcome")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom,20)
    }
}

struct LoginButtonContent: View {
    var body: some View {
        Text("LOGIN")
            .font(.headline)
            .foregroundColor(.white)
            .frame(width: 220, height: 60)
            .background(Color.green)
            .cornerRadius(15.0)
    }
}
