//
//  ProductCardView.swift
//  Vybes (iOS)
//
//  Created by MacBook on 2022-09-13.
//

import SwiftUI
 
struct ProductCardView: View {
    let image: Image
    let size: CGFloat
    let title: String
    let rating: Int
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            image
                .resizable()
                .frame(width: size, height: 200 * (size/210))
                .cornerRadius(20.0)
            Text(title).font(.title3).fontWeight(.bold)
             
            HStack  {
                Text("$1299")
                    .font(.title3)
                    .fontWeight(.regular)
                    .foregroundColor(.gray)
                Spacer()
                
                Button(action: {
    
                }) {
                    Image("add")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                }
            }
        }
        .frame(width: size)
        .padding()
        .background(Color.gray.opacity(0.15))
        .cornerRadius(20.0)
         
    }
}
