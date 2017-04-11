//
//  Grid.swift
//  Battleship
//
//  Created by Marty Avedon on 4/10/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit

class Grid {
    var view: UIView
    var color: UIColor
    var numberOfSquares: Int
    
    init(view: UIView, color: UIColor = .blue, numberOfSquares: Int = 5) {
        self.view = view
        self.color = color
        self.numberOfSquares = numberOfSquares
        
        let totalAreaOfGrid = numberOfSquares * numberOfSquares
        
        for iterator in 0..<totalAreaOfGrid {
            
            let y = ((iterator) / numberOfSquares)
            let x = ((iterator) % numberOfSquares)
            
            let side : CGFloat = (view.bounds.size.width) / CGFloat(numberOfSquares)
            let rect = CGRect(origin: CGPoint(x: side * CGFloat(x), y: (CGFloat(y) * side)), size: CGSize(width: side - 4, height: side - 4))
            
            let newSquare = Square(frame: rect)
            newSquare.backgroundColor = color
            newSquare.setTitleColor(.blue, for: .normal)
            newSquare.titleLabel!.font = UIFont(name: "Avenir-Black", size: 16)
            //newSquare.layer.borderColor = newSquare.titleColor(for: .normal)?.cgColor
            //newSquare.layer.borderWidth = 1

            view.addSubview(newSquare)
            
            newSquare.setTitle("\(UnicodeScalar(y + 65)!)\(x + 1)", for: .normal) // recall that the letters of the alphabet start at Unicode 0065 -- this gives us A1, B1, etc.
        }
    }
}

class Square: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let peg = CAShapeLayer()
        let diameter = self.bounds.width
        let circle = CGRect(x: 0, y: 0, width: diameter, height: diameter)
        peg.path = UIBezierPath(ovalIn: circle).cgPath
        peg.strokeColor = UIColor.blue.cgColor
        peg.lineWidth = 40
        peg.fillColor = UIColor.white.cgColor
        peg.name = "peg"
        
        self.layer.addSublayer(peg)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
