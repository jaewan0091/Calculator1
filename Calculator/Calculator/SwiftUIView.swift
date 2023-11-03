//
//  SwiftUIView.swift
//  Calculator
//
//  Created by 김재완 on 2023/11/01.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
         VStack {
             HStack {
                 ForEach(1..<6) { index in
                     Rectangle()
                         .frame(width: 50, height: 50)
                         .foregroundColor(.blue)
                         .overlay(
                             Text("Text \(index)")
                                 .foregroundColor(.white)
                         )
                         .cornerRadius(10)
                 }
             }
             .padding()
             
             HStack {
                 ForEach(1..<6) { index in
                     RoundedRectangle(cornerRadius: 10)
                         .frame(width: 70, height: 50)
                         .foregroundColor(.green)
                         .overlay(
                             Text("Label \(index)")
                                 .foregroundColor(.white)
                         )
                 }
             }
             .padding()
         }
     }
 }
#Preview {
    SwiftUIView()
}
