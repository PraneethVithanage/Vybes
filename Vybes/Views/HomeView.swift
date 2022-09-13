//
//  HomeView.swift
//  Vybes (iOS)
//
//  Created by MacBook on 2022-09-13.
//

import SwiftUI
 
struct HomeView: View {
    @State private var search: String = ""
    @State private var selectedIndex: Int = 1
    @ObservedObject var viewModel = ProducttViewModel()
    
    private let categories = ["All Products", "Popular", "Recent", "Price", "Brand", "Qulity"]
    var body: some View {
        NavigationView {
            ZStack {
                Color.white
                    .ignoresSafeArea()
                LoadingView(isShowing: .constant(viewModel.isloading)) {
                ScrollView (showsIndicators: false) {
                    VStack (alignment: .leading) {
                         
                        AppBarView()
                         
                        TagLineView()
                            .padding()
                        
                        ZStack{
                            Image("top_cover")
                                .resizable()
                                .frame(width: UIScreen.main.bounds.size.width, height: 200)
                                .edgesIgnoringSafeArea(.top)
                                .scaledToFit()
                            VStack(alignment: .leading) {
                                HStack{
                                Text("Improved Controller \nDesign With \nvitual Reality")
                                    .font(.system(size: 18))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.white)
                                    Spacer()
                                }.padding(.leading, 45)
                                HStack{
                                Button(action: {
                                    
                                }) {
                                    Text("Buy Now!")
                                        .font(.system(size: 12))
                                        .fontWeight(.semibold)
                                        .foregroundColor(Color.blue)
                                        .frame(width: 90, height: 15)
                                        .padding(3)
                                        .background(Color.white)
                                        .cornerRadius(5.0)
                                    
                                    
                                }.padding(.leading, 45)
                                    Spacer()
                                }
                            }
                        }
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0 ..< categories.count) { i in
                                    Button(action: {selectedIndex = i}) {
                                        CategoryView(isActive: selectedIndex == i, text: categories[i])
                                    }
                                }
                            }
                            .padding()
                        }
                         
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack (spacing: 0) {
                                ForEach(viewModel.productsLists, id: \.id) { result in
                                    NavigationLink(
                                        destination: DetailScreen(viewmodel: result),
                                        label: {
                                            ProductCardView(image:result.images, size: 210, title: result.title, price: result.price)
                                        })
                                        .navigationBarHidden(true)
                                        .foregroundColor(.black)
                                }
                                .padding(.leading)
                            }
                        }
                        .padding(.bottom)
                        Spacer().frame(height: 50)
                    }
                }
                }
                VStack {
                    Spacer()
                    BottomNavBarView()
                }
            }
        }
    }
}
 
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
 
 
struct BottomNavBarView: View {
    var body: some View {
        HStack {
            BottomNavBarItem(image: Image(systemName: "house"), action: {})
            BottomNavBarItem(image: Image(systemName: "suit.heart"), action: {})
            BottomNavBarItem(image: Image(systemName: "cart"), action: {})
            BottomNavBarItem(image: Image(systemName: "person"), action: {})
        }
        .padding()
        .background(Color.white).foregroundColor(Color.gray)
        .clipShape(Capsule())
        .padding(.horizontal)
        .shadow(color: Color.gray.opacity(0.15), radius: 8, x: 2, y: 6)
    }
}
 
struct BottomNavBarItem: View {
    let image: Image
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            image
                .frame(maxWidth: .infinity)
        }
    }
}
