//
//  TriviaAppTests.swift
//  TriviaAppTests
//
//  Created by Olimpia on 10/2/19.
//  Copyright © 2019 Olimpia. All rights reserved.
//

import XCTest
@testable import TriviaApp

class TriviaAppTests: XCTestCase {

 func testGetQuestions() {
    
    // Arrange
     
     let questionData = getSampleQuestionJSON()
     
     // Act
     
   let questions = TrivaQuestion.getQuestions(from: questionData)
    
    
    //assert
    XCTAssertTrue(questions.count == 10) 
 }

 func getSampleQuestionJSON() -> Data {
           guard let pathToData = Bundle.main.path(forResource: "sampleQuestions", ofType: "json") else {
               fatalError("sampleQuestions.json not found")
           }
           let internalUrl = URL(fileURLWithPath: pathToData)
           do {
               let data = try Data(contentsOf: internalUrl)
               return data
           }
           catch {
               fatalError("An error occurred: \(error)")
           }
       }
   

}
