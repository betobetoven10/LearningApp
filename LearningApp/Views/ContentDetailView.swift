//
//  ContentDetailView.swift
//  LearningApp
//
//  Created by Alberto Madueño Navarrete on 6/5/22.
//

import SwiftUI
import AVKit

struct ContentDetailView: View {
    @EnvironmentObject var model: ContentModel
    var body: some View {
        let lesson = model.currentLesson
        let url = URL(string: Constants.videoHostUrl + (lesson?.video ?? ""))
        //let url = URL(string: "https://player.vimeo.com/progressive_redirect/download/717272461/container/d0e17685-32e2-437b-8b26-c8dbd924ce8f/cd85b0a3/galveston_beach%20%282160p%29.mp4?expires=1654531246&loc=external&signature=17691072a433e7a4f7dfdac88e76bd4a98a311c67a720b4446467fcc538aa46e")
           
        VStack{
        if url != nil{
        VideoPlayer(player: AVPlayer(url: url!))
                .cornerRadius(10)
        }
        //Description
        CodeTextView()
        //NexLesson Button
            if model.hasNextLesson(){
                Button {
                    model.nextLesson()
                } label: {
                    ZStack{
                        Rectangle()
                            .frame(height: 48)
                            .foregroundColor(.green)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                        
                    Text("Next Lesson: \(model.currentModule!.content.lessons[model.currentLessonIndex + 1].title)")
                            .foregroundColor(.white)
                            .bold()
                    }
                }

            } else {
                //Show the complte lesson
                Button {
                    model.currentContentSelected = nil
                } label: {
                    ZStack{
                        Rectangle()
                            .frame(height: 48)
                            .foregroundColor(.green)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                        
                    Text("Complete")
                            .foregroundColor(.white)
                            .bold()
                    }
                }
            }
    }
        .padding()
        .navigationBarTitle(lesson?.title ?? "")
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView()
    }
}
