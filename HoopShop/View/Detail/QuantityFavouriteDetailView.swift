//
//  QuantityFavouriteDetailView.swift
//  HoopShop
//
//  Created by Dmytro Nimchynskyi on 17/08/2022.
//

import SwiftUI

struct QuantityFavouriteDetailView: View {
    // MARK: - PROPERTY
    @EnvironmentObject var cart: Cart
    @State private var counter: Int = 0
    
    // MARK: - BODY
    var body: some View {
        HStack(alignment: .center, spacing: 6, content: {
            Button(action: {
                if counter > 0 {
                    feedback.impactOccurred()
                    counter -= 1
                    cart.count = counter
                }
            }, label: {
                Image(systemName: "minus.circle")
            })
            
            Text("\(counter)")
                .fontWeight(.semibold)
                .frame(minWidth: 36)
            
            Button(action: {
                if counter < 100 {
                    feedback.impactOccurred()
                    counter += 1
                    cart.count = counter
                }
            }, label: {
                Image(systemName: "plus.circle")
            })
            
            Spacer()
            
            Button(action: {
                feedback.impactOccurred()
            }, label: {
                Image(systemName: "heart.circle")
                    .foregroundColor(.pink)
            })
            
        })//:HStack
        .font(.system(.title, design: .rounded))
        .foregroundColor(.black)
        .imageScale(.large)
    }
}

// MARK: - PREVIEW
struct QuantityFavouriteDetailView_Previews: PreviewProvider {
    static var previews: some View {
        QuantityFavouriteDetailView()
            .environmentObject(Cart())
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
