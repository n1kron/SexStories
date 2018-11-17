//
//  Story.swift
//  SexStories
//
//  Created by  Kostantin Zarubin on 14/11/2018.
//  Copyright © 2018  Kostantin Zarubin. All rights reserved.
//

import UIKit

struct Story {
    
    let storyTitle: String
    let description: String
    let story: String
    let rating: UIImage
    let image: UIImage
    
    
    init(storyTitle: String, description: String, story: String, rating: UIImage, image: UIImage) {
        self.storyTitle = storyTitle
        self.description = description
        self.story = story
        self.rating = rating
        self.image = image
    }
    
    init?(dictionary: [String: String]) {
        guard let storyTitle = dictionary["StoryTitle"], let description = dictionary["Description"], let story = dictionary["Story"], let rating = dictionary["Rating"], let photo = dictionary["Photo"],
            let image = UIImage(named: photo) , let ratingImage = UIImage(named: rating) else {
                return nil
        }
        self.init(storyTitle: storyTitle, description: description, story: story, rating: ratingImage, image: image)
    }
    
    static func allStories() -> [Story] {
        var stories = [Story]()
        guard let URL = Bundle.main.url(forResource: "Stories", withExtension: "plist"),
            let storiesFromPlist = NSArray(contentsOf: URL) as? [[String:String]] else {
                return stories
        }
        for dictionary in storiesFromPlist {
            if let story = Story(dictionary: dictionary) {
                stories.append(story)
            }
        }
        return stories
    }
    
}
