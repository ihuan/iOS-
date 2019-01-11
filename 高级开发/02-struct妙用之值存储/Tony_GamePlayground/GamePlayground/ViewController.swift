//
//  ViewController.swift
//  GamePlayground
//
//  Created by Chris Eidhof on 03-01-16.
//  Copyright © 2016 Chris Eidhof. All rights reserved.
//

import UIKit

var buttonOffset: CGFloat = 100

class MyButton: UIButton {
    
    var onClick: () -> () = {  () }
    
    @objc func tapped(sender: AnyObject) {
        onClick()
    }
}

func button(text: String, onClick: @escaping () -> ()) -> UIButton {
    let b = MyButton(type: .custom)
    b.isUserInteractionEnabled = true
    b.frame = CGRect(x: 0, y: buttonOffset, width: 200, height: 30)
    buttonOffset += b.frame.height + 10
    b.backgroundColor = UIColor.gray
    b.setTitle(text, for: [])
    b.addTarget(b, action: #selector(b.tapped(sender:)), for: .touchUpInside)
    b.onClick = onClick
    return b
}

//
public struct Health {
    public var points: Int = 100
    
    public init(dictionary: [String:AnyObject]) {
        points = (dictionary["points"] as? Int) ?? 100
    }
    
    public func serialize() -> [String:AnyObject] {
        return ["points": points as AnyObject]
    }
}

public struct Player {
    public var name: String = ""
    public var health: Health
}

extension Player {
    public init(dictionary: [String:AnyObject]) {
        let healthDict = dictionary["health"] as? [String:AnyObject]
        health = Health(dictionary: healthDict ?? [:])
        name = (dictionary["name"] as? String) ?? ""
    }
    
    func serialize() -> [String:AnyObject] {
        return ["name": name as AnyObject, "health": health.serialize() as AnyObject]
    }
}

public class Game {
    let userDefaults: Storage
    public var player: Player {
        didSet {
            save()
        }
    }

    public init(defaults: Storage = UserDefaults.standard) {
        userDefaults = defaults
        let playerDict = defaults.object(forKey: "player") as? [String: AnyObject]
        player = Player(dictionary: playerDict ?? [:])
    }
    
    func save() {
        userDefaults.set(player.serialize() as Any, forKey: "player")
        let b = userDefaults.synchronize()
        if b {
            print("Done!")
        }
    }
    
}

public protocol Storage {
    func object(forKey defaultName: String) -> Any?
    func set(_ value: Any?, forKey defaultName: String)
    func synchronize() -> Bool
}

/*
 这里就是协议的妙处
 我们让已经实现了 objectForKey 和 setValueForKey 的 UserDefaults 遵循 Storage协议
 
 让已经实现的类的方法，只暴露出想要的方法（即协议中的方法）
 */
extension UserDefaults: Storage {
}

class ViewController: UIViewController {
    var game = Game()
    
    override func viewDidLoad() {
        
        self.view.addSubview(button(text: "Add health point") { [unowned self] in
            self.game.player.health.points += 1
            self.updateLabel()
        })
        
        self.view.addSubview(button(text: "Reset health points") { [unowned self] in
            self.game.player.health.points = 100
            self.updateLabel()
            })

        updateLabel()
    }
    
    func updateLabel() {
        self.navigationItem.title = "\(self.game.player.health.points) health points"
    }
}

