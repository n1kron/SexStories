//
//  ViewController.swift
//  SexStories
//
//  Created by  Kostantin Zarubin on 13/11/2018.
//  Copyright © 2018  Kostantin Zarubin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    var stories = Story.allStories()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let layout = collectionView?.collectionViewLayout as? StoriesLayout {
            layout.delegate = self
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowStory" {
            if let nextViewController = segue.destination as? StoryViewController {
                if let story = sender as? Story {
                    nextViewController.story = story
                }
            }
        }
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.story = stories[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSize = (collectionView.frame.width - (collectionView.contentInset.left + collectionView.contentInset.right + 10)) / 2
        return CGSize(width: itemSize, height: itemSize)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowStory", sender: stories[indexPath.item])
    }
}

extension ViewController: StoriesLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {

        return stories[indexPath.item].image.size.height
    }
}

