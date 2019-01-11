//
//  GamePlaygroundTests.swift
//  GamePlaygroundTests
//
//  Created by Chris Eidhof on 03-01-16.
//  Copyright © 2016 Chris Eidhof. All rights reserved.
//

import XCTest
import GamePlayground

// 这里再也不用 继承UserDefault， 因为有了协议 Storage
class DefaultsMock {
    var dictionary: [String:AnyObject] = [:]
}

extension DefaultsMock: Storage {
    func object(forKey defaultName: String) -> Any? {
        return dictionary[defaultName]
    }
    
    func set(_ value: Any?, forKey defaultName: String) {
        dictionary[defaultName] = value as AnyObject
    }

}

class GamePlaygroundTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLoadHealth() {
        let mock = DefaultsMock()
        mock.set(42 as AnyObject, forKey: "player.health")
        let health = Health(dictionary: mock.dictionary)
        XCTAssertEqual(health.points, 42)
    }
    
    func testSaveHealth() {
        let mock = DefaultsMock()
        var health = Health(dictionary: mock.dictionary)
        health.points = 100
        XCTAssertEqual(mock.object(forKey: "player.health") as? Int, 100)
    }
    
    func testIncreaseHealth() {
        let mock = DefaultsMock()
        var health = Health(dictionary: mock.dictionary)
        health.points = 200
        XCTAssertEqual(mock.object(forKey: "player.health") as? Int, 200)
    }
    
    func testPlayerName() {
        let mock = DefaultsMock()
        var player = Player(dictionary: mock.dictionary)
        player.name = "Chris"
        XCTAssertEqual(mock.object(forKey: "player.name") as? String, "Chris")
    }
    
    func testPlayerHealthInjection() {
        let mock = DefaultsMock()
        var player = Player(dictionary: mock.dictionary)
        player.health.points = 35
        XCTAssertEqual(mock.object(forKey: "player.health") as? Int, 35)
    }
    
    func testGameHealthInjection() {
//        let mock = DefaultsMock()
//        let game = Game(defaults: mock)
        
        let game = Game()
        game.player.health.points = 35
        
        let playerDict = UserDefaults.standard.object(forKey: "player") as? [String: AnyObject]
        let player = Player(dictionary: playerDict ?? [:])
        
        XCTAssertEqual(player.health.points, 35)
    }
}
