//
//  LoginView.swift
//  Vybes (iOS)
//
//  Created by MacBook on 2022-09-13.
//

//  LoginView.swift
//  NewsApp
//
//  Created by MacBook on 2022-08-21.
//
import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var showingLoginScreen = false
    @State var users : [String] = UserDefaults.standard.stringArray(forKey: "userNames") ?? []
    @State var passwords : [String] = UserDefaults.standard.stringArray(forKey: "Passwords") ?? []
    @State private var showingAlert = false
    @State private var message = ""
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    
                    Image("Login_image")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.size.width, height: 200)
                        .edgesIgnoringSafeArea(.top)
                        .scaledToFit()
                    
                    Text("Sing In")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    
                    TextField("Email", text: $username)
                        .padding()
                        .frame(width: 300, height: 40)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 40)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                    
                    Spacer().frame(height: 20)
                    
                    Button("Login") {
                        if username == "" || password == "" {
                            showingAlert = true
                            message = "Please fill the password and user name"
                        } else {
                            authenticateUser(username: username, password: password)
                        }
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 40)
                    .background(.blue)
                    .cornerRadius(10)
                    Button("Register") {
                        authenticateUser(username: username, password: password)
                        if username == "" || password == "" {
                            showingAlert = true
                            message = "Please fill the password and user name"
                        } else {
                            showingAlert = true
                            message = "Successfully Registered"
                            users.append(username.lowercased())
                            passwords.append(password.lowercased())
                            UserDefaults.standard.set(users, forKey: "userNames")
                            UserDefaults.standard.set(passwords, forKey: "Passwords")
                        }
                        
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 40)
                    .background(.blue)
                    .cornerRadius(10)
                    VStack{
                        Spacer().frame(height: 20)
                        Divider()
                            .frame(height: 1)
                            .background(Color.gray.opacity(0.3))
                        Spacer().frame(height: 20)
                    }
                    Button("Continue With Facebook") {
                        if username == "" || password == "" {
                            showingAlert = true
                            message = "Please fill the password and user name"
                        } else {
                            authenticateUser(username: username, password: password)
                        }
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 40)
                    .background(.blue)
                    .cornerRadius(10)
                    
                    NavigationLink(destination: HomeView(), isActive: $showingLoginScreen) {
                        EmptyView()
                    }
                }
            }.navigationBarHidden(true)
        }.alert(message, isPresented: $showingAlert) {
            Button("OK", role: .cancel) { }
        }
    }
    
    func authenticateUser(username: String, password: String) {
        let index = users.firstIndex(of: username.lowercased()) ?? 0
        if users.contains(String(username.lowercased())){
            if passwords[index] == password.lowercased(){
                showingLoginScreen = true
            } else {
                showingAlert = true
                message = "Please check your password again"
            }
        } else {
            showingAlert = true
            message = "Please check your user name again"
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

