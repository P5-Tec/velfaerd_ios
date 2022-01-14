//
//  CustomSlider.swift
//  Velfaerds
//
//  Created by Patrick Saxbeck on 14/01/2022.
//

import SwiftUI

struct CustomSlider: View {
    @State var slWidth : CGFloat = 25
    
    var body: some View {
        
        VStack{
            ZStack(alignment: .leading){
                Rectangle().fill(Color.black.opacity(0.20)).frame(height: 6)
                Rectangle().frame(width: self.slWidth, height: 6)
                HStack{
                    Circle()
                        .fill(Color.black)
                        .frame(width: 18, height: 18)
                        .offset(x: self.slWidth)
                        .gesture(
                            DragGesture()
                                .onChanged({(value) in self.slWidth = value.location.x})
                        )
                }
            }
        }.padding()
    }
}

struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x:rect.minX, y:rect.midY))
        
        return path
    }
}

struct CustomSlider_Previews: PreviewProvider {
    static var previews: some View {
        CustomSlider()
    }
}
