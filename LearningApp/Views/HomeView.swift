//
//  ContentView.swift
//  LearningApp
//
//  Created by Alberto Madueño Navarrete on 5/28/22.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        ScrollView{
            LazyVStack{
                ForEach(model.modules) { module in
                    //Learning card
                    ZStack{
                        Rectangle()
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .aspectRatio(CGSize(width: 335, height: 175), contentMode: .fit)
                        HStack{
                            //Image
                            Image("swift")
                                .resizable()
                                .frame(width: 116, height: 116)
                                .clipShape(Circle())
                            Spacer()
                            //Text
                            VStack (alignment: .leading, spacing: 10){
                                //Headline
                                Text("Learn Swift")
                                    .bold()
                                //description
                                Text("Some Description")
                                    .padding(.bottom, 20)
                                    .font(.caption)
                                //Icons
                                HStack{
                                    //Number of lessons
                                    Image(systemName: "text.book.closed")
                                        .resizable()
                                        .frame(width: 15, height: 15)
                                    Text("20 Lessons")
                                        .font(.caption)
                                    //Time
                                    Image(systemName: "clock")
                                        .resizable()
                                        .frame(width: 15, height: 15)
                                    Text("3 Hours")
                                        .font(.caption)
                                }
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                    //Test card
                    
                }
            }
            .padding()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}
