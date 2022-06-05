//
//  ContentModel.swift
//  LearningApp
//
//  Created by Alberto Madueño Navarrete on 5/28/22.
//

import Foundation

class ContentModel: ObservableObject {
    
    //List of Modules
    @Published var modules = [Module]()
    
    //Current module
    @Published var currentModule: Module?
    
    //Current lesson
    @Published var currentLesson: Lesson?
    
    
    var currentModuleIndex = 0
    var currentLessonIndex = 0
    
    var styleData: Data?
    init() {
        getLocalData()
    }
    
    //MARK: Data Methods
    
    func getLocalData() {
        //Get the URL
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        do {
            //Read the file into a data object
            let jsonData = try Data(contentsOf: jsonUrl!)
            //Try to decoded the json into an array of modules

            let jsonDecoder = JSONDecoder()
            
            let modules = try jsonDecoder.decode([Module].self, from: jsonData)
            
            //Assigned parsed modules to modules property
            
            self.modules = modules
        } catch {
            //Log error
            print("Could not parse local data")
        }
        
        //parse the style data
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        do {
            let styleData = try Data(contentsOf: styleUrl!)
            self.styleData = styleData
        } catch {
            print("Could not parse data")
        }
        
    }
    
    //MARK: Module navigation methods
    
    func beginModule(_ moduleid:Int){
        //Find the index for this module ID
        
        for index  in 0..<modules.count{
            if modules[index].id == moduleid {
                currentModuleIndex = index
                break
            }
        }
        
        //Set the current module
        currentModule = modules[currentModuleIndex]
    }
    
    func beginLesson(_ lessonIndex:Int){
        //Find the index for this lesson ID
        if lessonIndex < currentModule!.content.lessons.count {
            currentLessonIndex = lessonIndex
        } else
        {
            currentLessonIndex = 0
        }
        
        //Set the current module
        currentLesson = currentModule!.content.lessons[currentLessonIndex]
    }
    
    func hasNextLesson() -> Bool {
        if currentLessonIndex + 1 < currentModule!.content.lessons.count {
            return true
        } else {
            return false
        }
    }
    
    func nextLesson() {
        currentLessonIndex += 1
        if currentLessonIndex < currentModule!.content.lessons.count{
            currentLesson = currentModule!.content.lessons[currentLessonIndex]
        } else {
            currentLesson = nil
            currentLessonIndex = 0
        }
    }
}
