//
//  TitleScreenViewController.swift
//  Battleship
//
//  Created by Marty Avedon on 4/10/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit
import AudioToolbox

class TitleScreenViewController: UIViewController {

    var topImage: UIImageView!
    var publishersTitle: UILabel!
    var gameTitle: UILabel!
    var onePlayer: UIButton!
    var twoPlayer: UIButton!
    var options: UIButton!
    
    var userInterfaceElements: [UIView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .blue
        
        createViews()
        
        userInterfaceElements = [
              topImage
            , publishersTitle
            , gameTitle
            , onePlayer
            , twoPlayer
            , options
        ]
        
        generateUI([positionViews, styleViews])
        
        onePlayer.addTarget(self, action: #selector(didPressOnePlayer(sender:)), for: .touchUpInside)
        twoPlayer.addTarget(self, action: #selector(didPressTwoPlayer(sender:)), for: .touchUpInside)
        options.addTarget(self, action: #selector(didPressOptions(sender:)), for: .touchUpInside)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        
        animateTitle()
    }
    
    func didPressOnePlayer(sender: UIButton) {
        AudioServicesPlaySystemSound(1033)
        animateButton(sender)
        
        self.present(OnePlayerViewController(), animated: true, completion: nil)
    }
    
    func didPressTwoPlayer(sender: UIButton) {
        AudioServicesPlaySystemSound(1033)
        animateButton(sender)
    }
    
    func didPressOptions(sender: UIButton) {
        AudioServicesPlaySystemSound(1033)
        animateButton(sender)
        
        self.present(OptionsViewController(), animated: true, completion: nil)
    }
    
    func createViews() {
        topImage = UIImageView()
        publishersTitle = UILabel()
        gameTitle = UILabel()
        onePlayer = UIButton()
        twoPlayer = UIButton()
        options = UIButton()
    }
    
    func styleViews() {
        topImage.contentMode = .scaleAspectFill
        let tintImage = #imageLiteral(resourceName: "titleImage").withRenderingMode(.alwaysTemplate)
        topImage.image = tintImage
        topImage.tintColor = .white
        
        publishersTitle.font = UIFont(name: "Avenir-BlackOblique", size: 20)
        publishersTitle.textColor = .white
        publishersTitle.textAlignment = .center
        publishersTitle.text = "AC3.2 & Jason Gresh present..."
        
        gameTitle.font = UIFont(name: "Mechfire-Bold", size: 45)
        gameTitle.textColor = .white
        gameTitle.textAlignment = .center
        gameTitle.text = "Battleship"
        
        _ = [
              onePlayer
            , twoPlayer
            , options
        ].map { $0.titleLabel!.font = UIFont(name: "Menlo-Bold", size: 20) }
        
        _ = [
              onePlayer
            , twoPlayer
            , options
        ].map { $0.tintColor = .white }
        
        onePlayer.setTitle("• One Player".uppercased(), for: .normal)
        twoPlayer.setTitle("• Two Players".uppercased(), for: .normal)
        options.setTitle("• Options".uppercased(), for: .normal)
    }
    
    func positionViews() {
        addToView(userInterfaceElements, view: self.view)
        allowProgrammableConstraints(userInterfaceElements)
        
        _ = [
               topImage.bottomAnchor.constraint(equalTo: publishersTitle.topAnchor)
            , topImage.leadingAnchor.constraint(equalTo: view.leadingAnchor)
            , topImage.widthAnchor.constraint(equalTo: view.widthAnchor)
            , publishersTitle.bottomAnchor.constraint(equalTo: gameTitle.topAnchor)
            , publishersTitle.centerXAnchor.constraint(equalTo: gameTitle.centerXAnchor)
            , gameTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            , gameTitle.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            , onePlayer.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            , onePlayer.topAnchor.constraint(equalTo: gameTitle.bottomAnchor, constant: 4)
            , twoPlayer.leadingAnchor.constraint(equalTo: onePlayer.leadingAnchor)
            , twoPlayer.topAnchor.constraint(equalTo: onePlayer.bottomAnchor, constant: 4)
            , options.leadingAnchor.constraint(equalTo: twoPlayer.leadingAnchor)
            , options.topAnchor.constraint(equalTo: twoPlayer.bottomAnchor, constant: 4)
        ].map { $0.isActive = true }
    }
    
    func animateTitle() {
        UIView.animate(withDuration: 0.75, delay: 0, options: [.repeat, .autoreverse], animations: {
            self.gameTitle.alpha = 0.5
        }, completion: { finish in
            self.gameTitle.alpha = 1.0
        })
    }
    
    func animateButton(_ button: UIButton) {
        UIView.animate(withDuration: 0.25, delay: 0, options: [.autoreverse], animations: {
            button.alpha = 0.5
        }, completion: { finish in
            button.alpha = 1.0
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
