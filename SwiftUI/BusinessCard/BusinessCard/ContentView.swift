//
//  ContentView.swift
//  BusinessCard
//
//  Created by Kathryn Whelan on 2/18/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color(red: 0.00, green: 0.81, blue: 0.79)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                Image("katie")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .offset(CGSize(width: 3.0, height: 40.0))
                    .frame(width: 150.0, height: 150.0)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 5))
                Text("Kathryn Whelan")
                    .font(Font.custom("Pacifico-Regular", size: 40))
                    .bold()
                    .foregroundColor(.white)
                Text("Software Engineer")
                    .foregroundColor(.white)
                    .font(.system(size : 25))
                Divider()
                InfoView(text:"952-942-1966", imageName: "phone.fill")
                InfoView(text: "klwhelan@gmail.com", imageName: "envelope.fill")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
