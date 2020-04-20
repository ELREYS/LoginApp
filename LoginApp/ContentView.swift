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
    
    let storedUsername = "Bob"
    let storedPassword = "Marley"
    
    @State var userName = ""
    @State var password = ""
    @State var authenticationDidFail:Bool  = false
    @State var authenticationDidSucced:Bool  = false
    @State var editingMode: Bool = false
    
    var body: some View {
        ZStack{
            VStack {
                WelcomeText()
                UserImage()
                if authenticationDidSucced{
                    Text("Login successful!")
                        .font(.headline)
                    .frame(width: 250, height: 80)
                        .background(Color.green)
                        .cornerRadius(20.0)
                        .foregroundColor(.white)
                        .animation(Animation.easeOut)
                    
                }
                VStack {
                    UsernameTextField(userName: $userName,editingMode: $editingMode)
                    PasswordSecureField(password: $password)
                    if authenticationDidFail{
                        Text("Information not correctly. Try again.")
                            .offset(y:-10)
                            .foregroundColor(.red)
                    }
                    Button(action: {
                        if self.userName == self.storedUsername && self.password == self.storedPassword{
                            self.authenticationDidFail = false
                            self.authenticationDidSucced = true
                        }
                        else{
                            self.authenticationDidFail = true
                        }
                    }){
                        LoginButtonContent()
                    }
                    
                }.padding()
                
            }
            
        }
        .offset(y:editingMode ? -150:0)
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

struct UsernameTextField: View {
    
    @Binding var userName:String
    @Binding var editingMode: Bool
    
    var body: some View {
        TextField("Username", text:$userName,onEditingChanged: {
            edit in if edit{
                self.editingMode = true
                
            }
            else{
                self.editingMode = false
            }
        })
            .padding()
            .background(lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom,20)
    }
}

struct PasswordSecureField: View {
    
    @Binding var password:String
    @Binding var editingMode: Bool
    
    var body: some View {
        SecureField("Password", text:$password)
            .padding()
            .background(lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom,20)
    }
}
