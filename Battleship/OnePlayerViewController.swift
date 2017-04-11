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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .blue
        
        gridContainer = UIView()
       // gridContainer.backgroundColor = .white
        
        self.view.addSubview(gridContainer)
        
        gridContainer.translatesAutoresizingMaskIntoConstraints = false
        
        gridContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        gridContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        gridContainer.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        gridContainer.heightAnchor.constraint(equalTo: gridContainer.widthAnchor).isActive = true
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
       grid = Grid(view: gridContainer, color: .blue, numberOfSquares: 5)
    }

}
