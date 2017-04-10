//
//  TitleScreenViewController.swift
//  Battleship
//
//  Created by Marty Avedon on 4/10/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit

class TitleScreenViewController: UIViewController {

    var gameTitle: UILabel!
    var onePlayer: UIButton!
    var twoPlayer: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .blue
        
        createViews()
        positionViews()
        styleViews()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        
        animateTitle()
    }
    
    func createViews() {
        gameTitle = UILabel()
        onePlayer = UIButton()
        twoPlayer = UIButton()
    }
    
    func styleViews() {
        gameTitle.font = UIFont(name: "Mechfire-Bold", size: 40)
        gameTitle.textColor = .white
        gameTitle.textAlignment = .center
        gameTitle.text = "Battleship"
        
        onePlayer.titleLabel!.font = UIFont(name: "Menlo-Bold", size: 20)
        twoPlayer.titleLabel!.font = UIFont(name: "Menlo-Bold", size: 20)
        onePlayer.setTitle("• One Player".uppercased(), for: .normal)
        twoPlayer.setTitle("• Two Players".uppercased(), for: .normal)
        
        _ = [
                onePlayer
               , twoPlayer
        ].map { $0.tintColor = .white }
    }
    
    func positionViews() {
        self.view.addSubview(gameTitle)
        self.view.addSubview(onePlayer)
        self.view.addSubview(twoPlayer)
        
        gameTitle.translatesAutoresizingMaskIntoConstraints = false
        onePlayer.translatesAutoresizingMaskIntoConstraints = false
        twoPlayer.translatesAutoresizingMaskIntoConstraints = false
        
        _ = [
              gameTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            , gameTitle.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            , onePlayer.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            , onePlayer.topAnchor.constraint(equalTo: gameTitle.bottomAnchor, constant: 8)
            , twoPlayer.leadingAnchor.constraint(equalTo: onePlayer.leadingAnchor)
            , twoPlayer.topAnchor.constraint(equalTo: onePlayer.bottomAnchor, constant: 8)
        ].map { $0.isActive = true }
    }
    
    func animateTitle() {
        UIView.animate(withDuration: 0.75, delay: 0, options: [.repeat, .autoreverse], animations: {
            self.gameTitle.alpha = 0.5
        }, completion: { finish in
            self.gameTitle.alpha = 1.0
        })
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
