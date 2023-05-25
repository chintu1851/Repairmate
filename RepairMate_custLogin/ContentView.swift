//
//  ContentView.swift
//  RepairMate_custLogin
//
//  Created by Arjun Roperia on 2023-05-22.
//

import SwiftUI
import FirebaseAuth
struct ContentView: View {
    @AppStorage("uid") var userID : String = ""
    var body: some View {
        if userID ==  ""{
            AuthView()
        }
        else{
            Text("Logged in! ")
            Button(action:{
                let firebaseAuth = Auth.auth()
                do {
                  try firebaseAuth.signOut()
                    withAnimation{
                        userID = ""
                    }
                } catch let signOutError as NSError {
                  print("Error signing out: %@", signOutError)
                }
            }){
                Text("Sign out")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
