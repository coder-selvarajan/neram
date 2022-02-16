//
//  ContentView.swift
//  Neram
//
//  Created by Selvarajan on 15/12/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
            
            Button(action: {
                print("Button pressed")
            }, label: {
                Text("Button")
                
            })
            
            GroupBox {
                Text("**E-mail:** myemail@mail.com")
                
                GroupBox {
                    Text("Not available on the weekends")
                    GroupBox {
                        Text("but on next weekend")
                    }
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
