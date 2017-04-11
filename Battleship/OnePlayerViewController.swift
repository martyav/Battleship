//
//  OnePlayerViewController.swift
//  Battleship
//
//  Created by Marty Avedon on 4/10/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit

class OnePlayerViewController: UIViewController {
    var gridContainer: UIView!
    var grid: Grid!
    var instructions: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .blue
        
        generateUI([createViews, styleViews, positionViews])
    }
    
    override func viewDidAppear(_ animated: Bool) {
       grid = Grid(view: gridContainer, color: .blue, numberOfSquares: 4)
    }

    func createViews() {
        gridContainer = UIView()
        instructions = UILabel()
    }
    
    func styleViews() {
        instructions.textColor = .white
        instructions.font = UIFont(name: "MechFire-Bold", size: 30)
        instructions.text = "Place Your Ships"
    }
    
    func positionViews() {
        addToView([gridContainer, instructions], view: self.view)
        allowProgrammableConstraints([gridContainer, instructions])
        
        _ = [
            gridContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
            , gridContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
            , gridContainer.topAnchor.constraint(equalTo: view.topAnchor, constant: 40)
            , gridContainer.heightAnchor.constraint(equalTo: gridContainer.widthAnchor)
            
            , instructions.topAnchor.constraint(equalTo: gridContainer.bottomAnchor, constant: 16)
            , instructions.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ].map { $0.isActive = true }

    }
}
