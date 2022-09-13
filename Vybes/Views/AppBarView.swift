//
//  AppBarView.swift
//  Vybes (iOS)
//
//  Created by MacBook on 2022-09-13.
//

import SwiftUI
 
struct AppBarView: View {
    var body: some View {
        HStack {
            Button(action: {}) {
                Image(systemName: "slider.horizontal.3")
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10.0)
            }
             
            Spacer()
      
            Button(action: {}) {
                Image("search")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
            }
            Button(action: {}) {
                Image("bag")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
            }
        }
        .padding(.horizontal)
    }
}
 
struct AppBarView_Previews: PreviewProvider {
    static var previews: some View {
        AppBarView()
    }
}
