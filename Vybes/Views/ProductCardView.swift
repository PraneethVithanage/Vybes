//
//  ProductCardView.swift
//  Vybes (iOS)
//
//  Created by MacBook on 2022-09-13.
//

import SwiftUI

struct ProductCardView: View {
    let image: String
    let size: CGFloat
    let title: String
    let price: String
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            Image(systemName: "mihcm-logo").data(url: URL(string: image as! String)!)
                .scaledToFill()
                .frame(width: 90,height: 70, alignment: .center)
            
            Text(title).font(.title3).fontWeight(.bold)
            
            HStack  {
                Text(price)
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

extension Image {
    func data(url:URL) -> Self {
        if let data = try? Data(contentsOf: url) {
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        }
        return self
            .resizable()
    }
}
