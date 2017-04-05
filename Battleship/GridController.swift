//
//  GridController.swift
//  Battleship
//
//  Created by Jason Gresh on 9/16/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class GridController: UIViewController {
    
    @IBOutlet weak var gameLabel: UILabel!
    @IBOutlet weak var buttonContainer: UIView!
    @IBOutlet weak var Score: UILabel!
    
    let howManySquares: Int
    
    let brain: MontyBrain
    var loaded: Bool
    var shipCounter = 0
    let resetTitle = "Reset"
    
    let bigShip = Carrier()
    let nameSake = Battleship()
    let medShip = Cruiser()
    let sub = Submarine()
    let lilShip = Destroyer()
    
    var theFleet = [Ship]()
    
    required init?(coder aDecoder: NSCoder) {
        self.howManySquares = 100
        self.loaded = false
        self.brain = MontyBrain(numSquares: self.howManySquares, ships: [bigShip, nameSake, medShip, sub, lilShip])
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        theFleet = brain.ships
    }
    
    override func viewDidLayoutSubviews() {
        if !loaded {
            setUpGameButtons(v: buttonContainer, totalButtons: self.howManySquares, buttonsPerRow: 10)
            self.view.setNeedsDisplay()
        }
        loaded = true
    }
    
    func resetButtonColors() {
        for v in buttonContainer.subviews {
            if let button = v as? UIButton {
                button.backgroundColor = UIColor.blue
                button.isEnabled = true
            }
        }
    }
    
    func handleReset() {
        resetButtonColors()
        brain.checkerArr = [Int]()
        brain.setupSquares(numSpots: 17)
        setUpGameButtons(v: buttonContainer, totalButtons: self.howManySquares, buttonsPerRow: 10)
        shipCounter = 0
        Score.text = String(shipCounter)
    }
    
    func checkWin(sender: UIButton) {
        if brain.checkerArr.contains(sender.tag - 1) {
            shipCounter += 1
            Score.text = String(shipCounter)
        }
        if shipCounter == brain.checkerArr.count {
            gameLabel.text = "Hooray! You sank all the ships!"
        }
    }
    func disableButton() { //need to fix this so we can get more hits
        for v in buttonContainer.subviews {
            if let button = v as? UIButton {
                button.isEnabled = false
            }
        }
    }
    
    @IBAction func resetTapped(_ sender: UIButton) {
        handleReset()
    }
    
    func buttonTapped(_ sender: UIButton) {
        gameLabel.text = sender.currentTitle
        
        if brain.checkSquare(sender.tag - 1) {
            if let coor = sender.titleLabel?.text {
                gameLabel.text = "\(coor) is a hit!" //lilShip.msg()
                /*
                 we write a function here that checks ship arrays
                 if the hit is in a particular ship's array we display
                 that ship's ship.msg text
                 */
            }
            sender.backgroundColor = UIColor.red
            // disableButton()
        } else {
            if let coor = sender.titleLabel?.text {
                gameLabel.text = "\(coor) is a miss!" //see comment above
            }
            sender.backgroundColor = UIColor.white
        }
        checkWin(sender: sender)
    }
    
    func setUpResetButton() {
        let resetRect = CGRect(x: 10, y: 300, width: 60, height: 40)
        let resetButton = UIButton(frame: resetRect)
        
        resetButton.setTitle(resetTitle, for: UIControlState())
        resetButton.addTarget(self, action: #selector(handleReset), for: .touchUpInside)
        view.addSubview(resetButton)
    }
    
    func setUpGameLabel () {
        gameLabel.text = "Let's sink some ships!"
    }
    
    func setUpGameButtons(v: UIView, totalButtons: Int, buttonsPerRow: Int) {
        var yVal = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"]
        for i in 1...howManySquares {
            let index = i - 1
            
            let y = ((index) / buttonsPerRow)
            let x = ((index) % buttonsPerRow)
            
            let side : CGFloat = (v.bounds.size.width - 10) / CGFloat(buttonsPerRow)
            let rect = CGRect(origin: CGPoint(x: side * CGFloat(x), y: (CGFloat(y) * side)), size: CGSize(width: side - 2, height: side - 2))
            
            let button = UIButton(frame: rect)
            
            button.tag = i
            button.backgroundColor = UIColor.blue
            
            var currentTitle = String(x+1) + "\(yVal[y])"
            currentTitle = currentTitle.uppercased()
            
            button.setTitle(currentTitle, for: UIControlState())
            button.titleLabel?.font = UIFont(name: "Futura", size: 17)
            button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
            
            v.addSubview(button)
        }
        
        setUpGameLabel()
    }
}
