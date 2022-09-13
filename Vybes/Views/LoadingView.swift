//
//  LoadingView.swift
//  Vybes (iOS)
//
//  Created by MacBook on 2022-09-13.
//

import SwiftUI

struct LoadingView<Content>: View where Content: View {
    
    @Binding var isShowing: Bool
    var content: () -> Content
    
    var body: some View {
        ZStack(alignment: .center) {
            
            self.content()
                .disabled(self.isShowing)
            
            VStack {
                Text("Loading...")
                ActivityIndicator(isAnimating: .constant(true), style: .large)
                
            }
            .frame(width: UIScreen.main.bounds.size.width, height:UIScreen.main.bounds.size.height - 200)
            .background(.white.opacity(0.55))
            .opacity(self.isShowing ? 1 : 0)
        }
    }
}

struct ActivityIndicator: UIViewRepresentable {
    
    @Binding var isAnimating: Bool
    let style: UIActivityIndicatorView.Style
    
    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}
