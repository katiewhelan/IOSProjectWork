//
//  InfoView.swift
//  BusinessCard
//
//  Created by Kathryn Whelan on 2/18/21.
//

import SwiftUI

struct InfoView: View {
    let text: String
    let imageName: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.white)
            .frame( height: 50)
            .overlay(HStack
            {
                Image(systemName: imageName)
                Text(text)
            }).foregroundColor(.black)
            .padding(.all)
    }
}


struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(text: "Hello", imageName:"phone.fill")
            .previewLayout(.sizeThatFits)
    }
}
