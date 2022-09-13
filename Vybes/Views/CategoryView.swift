//
//  CategoryView.swift
//  Vybes (iOS)
//
//  Created by MacBook on 2022-09-13.
//

import SwiftUI
 
struct CategoryView: View {
    let isActive: Bool
    let text: String
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            Text(text)
                .font(.system(size: 18))
                .fontWeight(.medium)
                .foregroundColor(isActive ? Color.white : Color.black)
                .padding(.vertical,5)
                .padding(.horizontal,15)
                .background(isActive ? Color.blue : Color.gray.opacity(0.3))
                .cornerRadius(5)
        }
        .padding(.trailing)
    }
}
