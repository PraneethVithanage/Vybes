//
//  DetailScreen.swift
//  Vybes (iOS)
//
//  Created by MacBook on 2022-09-13.
//

import SwiftUI

struct DetailScreen: View {
    
    let viewmodel: Product?
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack {
            ScrollView  {
                //Product Image
                VStack{
                    ZStack{
                        Image("background")
                            .resizable()
                            .aspectRatio(1,contentMode: .fit)
                            .edgesIgnoringSafeArea(.top)
                        
                        Image(systemName: "mihcm-logo").data(url: URL(string: viewmodel?.images as! String)!)
                            .scaledToFill()
                            .frame(width: 200, height: 200)
                        
                    }
                }
                DescriptionView(rating: 2, viewmodel: viewmodel)
                
            }
            .edgesIgnoringSafeArea(.top)
        }
            .navigationViewStyle(.stack)
            .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton(action: {presentationMode.wrappedValue.dismiss()}), trailing: Image(systemName: "lineweight"))
    }
}


struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

//struct DetailScreen_Previews: PreviewProvider {
//    static var previews: some View {
//       // DetailScreen(viewmodel: Furniture(id: 1, title: "Sofas", imageName: "1", rating: 5))
//    }
//}


struct ColorDotView: View {
    let color: Color
    var body: some View {
        color
            .frame(width: 24, height: 24)
            .clipShape(Circle())
    }
}

struct DescriptionView: View {
    let rating : Int
    let viewmodel: Product?
    
    @State var selected = -1
    @State var message = false
    @State private var count = 0
    
    var body: some View {
        VStack (alignment: .leading) {
            //                Title
            Text(viewmodel?.title ?? "")
                .font(.title)
                .fontWeight(.bold)
            //                Rating
            HStack (spacing: 4) {
                ForEach(0..<5) { rate in
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(self.selected >= rate ? .yellow : .gray)
                        .onTapGesture {
                            self.selected = rate
                            self.message.toggle()
                        }
                }
                Text("(\(rating))")
                    .opacity(0.5)
                    .padding(.leading, 8)
                Spacer()
                
                Text(viewmodel?.price ?? "")
                    .font(.title)
                    .foregroundColor(.black)
                
            }
            .alert(isPresented: $message) {
                Alert(title: Text("Rating Submit"), message: Text("You Rated \(self.selected + 1) out of 5 Star Rating"), dismissButton: .none)
            }
            
            Text("Description")
                .fontWeight(.medium)
                .padding(.vertical, 8)
            Text(viewmodel?.productDescription ?? "")
                .font(.system(size: 14))
                .lineSpacing(8.0)
                .opacity(0.6)
            
            HStack {
                
                Spacer()
                
                VStack{
                    Button(action: {
                    }) {
                        Image("eye")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                    }
                    Text("Improved Optics")
                        .font(.system(size: 12))
                        .foregroundColor(.black)
                }.padding(5)
                
                Spacer()
                
                VStack{
                    Button(action: {
                    }) {
                        Image("sun")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                    }
                    Text("Clear Brightness")
                        .font(.system(size: 12))
                        .foregroundColor(.black)
                }.padding(5)
                
                Spacer()
                
                VStack{
                    Button(action: {
                    }) {
                        Image("wifi")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                    }
                    Text("Wifi Controllers")
                        .font(.system(size: 12))
                        .foregroundColor(.black)
                }.padding(5)
                
                Spacer()
            }
            
            Button(action: {
                
            }) {
                Text("Checkout")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
                    .frame(width: 300, height: 25)
                    .padding()
                    .padding(.horizontal, 8)
                    .background(Color.black)
                    .cornerRadius(10.0)
                
                
            }
            .padding(.top)
        }
        .padding()
        .padding(.top)
        .background(Color.white)
        .cornerRadius(30, corners: [.topLeft, .topRight])
        .offset(x: 0, y: -30.0)
    }
}


struct BackButton: View {
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            Image(systemName: "chevron.backward")
                .foregroundColor(.black)
                .padding(.all, 12)
                .background(Color.white)
                .cornerRadius(8.0)
        }
    }
}
