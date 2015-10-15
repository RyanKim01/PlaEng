//
//  BackgroundAnimationViewController.swift
//  Koloda
//
//  Created by Eugene Andreyev on 7/11/15.
//  Copyright (c) 2015 CocoaPods. All rights reserved.
//

import UIKit
import Parse
import Koloda
import pop
import AVFoundation

private let frameAnimationSpringBounciness:CGFloat = 9
private let frameAnimationSpringSpeed:CGFloat = 16
private let kolodaCountOfVisibleCards = 2
private let kolodaAlphaValueSemiTransparent:CGFloat = 0.1

class BackgroundAnimationViewController: UIViewController, KolodaViewDataSource, KolodaViewDelegate {
    @IBOutlet weak var kolodaView: CustomKolodaView!
    var chapter: Chapter?
    var vocabLists = []
    var score = 0
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Vocab Gallery"
        kolodaView.alphaValueSemiTransparent = kolodaAlphaValueSemiTransparent
        kolodaView.countOfVisibleCards = kolodaCountOfVisibleCards
        kolodaView.dataSource = self
        kolodaView.delegate = self
        self.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        
        let vocabQuery = PFQuery(className: "Vocab")
        vocabQuery.whereKey("fromChapter", equalTo: chapter!)
        vocabQuery.selectKeys(["vocabs"])
        vocabQuery.findObjectsInBackgroundWithBlock {(result: [AnyObject]?, error: NSError?) -> Void in
            // 8
            //            var vocabLists = result as! [String]
            //            println(vocabLists)
        }
        self.navigationItem.title = "0 Points"
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back.png"), style: UIBarButtonItemStyle.Plain, target: nil, action: "goBackToPreviousPage")
        
    }
    
    func goBackToPreviousPage() {
        
            let vocabMainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("VocabPageVC") as! StudentVocabPageViewController
        self.navigationController?.pushViewController(vocabMainVC, animated: true)
//        navigationController?.popViewControllerAnimated(true)
    }
    
    //MARK: IBActions
    @IBAction func leftButtonTapped() {
        kolodaView?.swipe(SwipeResultDirection.Left)
    }
    
    @IBAction func rightButtonTapped() {
        kolodaView?.swipe(SwipeResultDirection.Right)
        score = score + 8
        self.navigationItem.title = "\(score) Points"
    }
    
    //    @IBAction func undoButtonTapped() {
    //        kolodaView?.revertAction()
    //    }
    
    //MARK: KolodaViewDataSource
    func kolodaNumberOfCards(koloda: KolodaView) -> UInt {
        //        return UInt(vocabLists.count)
        return 6
    }
    
    func kolodaViewForCardAtIndex(koloda: KolodaView, index: UInt) -> UIView {
        return UIImageView(image: UIImage(named: "cards_\(index + 1)"))
    }
    func kolodaViewForCardOverlayAtIndex(koloda: KolodaView, index: UInt) -> OverlayView? {
        return NSBundle.mainBundle().loadNibNamed("CustomOverlayView",
            owner: self, options: nil)[0] as? OverlayView
    }
    
    //MARK: KolodaViewDelegate
    
    func kolodaDidSwipedCardAtIndex(koloda: KolodaView, index: UInt, direction: SwipeResultDirection) {
        if SwipeResultDirection.Right == direction {
//        score = score + 8
//        self.navigationItem.title = "\(score) Points"
        }
    }
    
    func kolodaDidRunOutOfCards(koloda: KolodaView) {
        //Example: reloading
        kolodaView.resetCurrentCardNumber()
        score = 0
        self.navigationItem.title = "\(score) Points"

    }
    
    func kolodaDidSelectCardAtIndex(koloda: KolodaView, index: UInt) {
        //        UIApplication.sharedApplication().openURL(NSURL(string: "http://yalantis.com/")!)
        
        if Int(index) == 0 {
        readTheWord("compete for")
        } else if Int(index) == 1 {
        readTheWord("germ")
        } else if Int(index) == 2 {
        readTheWord("thought")
        } else if Int(index) == 3 {
            readTheWord("space")
        } else if Int(index) == 4 {
            readTheWord("brain")
        } else if Int(index) == 5 {
            readTheWord("die")
        } 
    }
    
    func readTheWord(word: String) {
        let utterance = AVSpeechUtterance(string: word)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_7_1)
        {
            utterance.rate = 0.05;
        }else{
            utterance.rate = 0.3;
        }
        
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speakUtterance(utterance)
    }
    
    func kolodaShouldApplyAppearAnimation(koloda: KolodaView) -> Bool {
        return true
    }
    
    func kolodaShouldMoveBackgroundCard(koloda: KolodaView) -> Bool {
        return false
    }
    
    func kolodaShouldTransparentizeNextCard(koloda: KolodaView) -> Bool {
        return false
    }
    
    func kolodaBackgroundCardAnimation(koloda: KolodaView) -> POPPropertyAnimation? {
        let animation = POPSpringAnimation(propertyNamed: kPOPViewFrame)
        animation.springBounciness = frameAnimationSpringBounciness
        animation.springSpeed = frameAnimationSpringSpeed
        return animation
    }
}
