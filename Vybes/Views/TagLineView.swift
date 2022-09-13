//
//  TagLineView.swift
//  Vybes (iOS)
//
//  Created by MacBook on 2022-09-13.
//

import SwiftUI
 
struct TagLineView: View {
    var body: some View {
        Text("Enjoy the world \ninto virtual reality ")
            .font(.system(size: 28))
            .fontWeight(.bold)
            .foregroundColor(Color.black)
    }
}
 
struct TagLineView_Previews: PreviewProvider {
    static var previews: some View {
        TagLineView()
    }
}
