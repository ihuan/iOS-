//
//  ViewController.swift
//  DemoSwift
//
//  Created by LTH on 2018/9/7.
//  Copyright © 2018 i-Sprint. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let newsView = NewsView(frame: CGRect(x: 0, y: 64, width: 200, height: 300))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor.purple
        //testDemo1()
        //testDemo2()
        testDemo3()
    }

    func testDemo3() {
        
        newsView.center = view.center
        view.addSubview(newsView)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 仿一个Model
        let news = News(title: "谢谢点击，我的笑容够灿烂吧!", thumbnailUrl: "2.png", titleColor: "black")
        // 根据Model，仿一个 ViewModel
        let newsViewModel = NewsViewModel(news: news) {
            print("闭包")
        }
        // 传入这个实现了 NewsPresentable 协议的 ViewModel
        newsView.updateWithPresenter(presenter: newsViewModel)
    }
    
    func testDemo2() {
        let p1: Person = ["Bruce", "10"]
        print(p1)
        
        let p2: Person = ["布鲁斯", "10"]
        print(p2)
        
        print(p1 == p2)
    }
    
    func testDemo1() {
        let kingsoftWord = KingsoftWord(name: "A", pronunciation: "pA", definition: "dA")
        renderWord(word: kingsoftWord)
        // 协议的扩展
        kingsoftWord.testExtension()
        
        let youdaoWord = YoudaoWord(name: "B", pronunciation: "pB", definition: "dB")
        renderWord(word: youdaoWord)
        
        let baiduWord = BaiduWord(name: "C", pronunciation: "pC", definition: "dC")
        renderWord(word: baiduWord)
    }
    
    func renderWord(word: WordType) {
        print(word.name)
        print(word.pronunciation)
        print(word.definition)
    }
    
}

