//
//  RectangleCard.swift
//  LearningApp
//
//  Created by Alberto Madueño Navarrete on 6/5/22.
//

import SwiftUI

struct RectangleCard: View {
    var color = Color.white
    var body: some View {
        Rectangle()
            .frame(height: 48)
            .foregroundColor(color)
            .cornerRadius(10)
            .shadow(radius: 5)
    }
}

struct RectangleCard_Previews: PreviewProvider {
    static var previews: some View {
        RectangleCard()
    }
}
