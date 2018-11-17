//
//  StoryViewController.swift
//  SexStories
//
//  Created by  Kostantin Zarubin on 13/11/2018.
//  Copyright © 2018  Kostantin Zarubin. All rights reserved.
//

import UIKit

class StoryViewController: UIViewController {
    
    @IBOutlet weak var storyTextView: UITextView!
    var story: Story!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        storyTextView.text = story.story
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        storyTextView.setContentOffset(CGPoint.zero, animated: false)
    }
}
