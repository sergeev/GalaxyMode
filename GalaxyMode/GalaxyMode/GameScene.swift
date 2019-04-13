//
//  GameScene.swift
//  GalaxyMode
//
//  Created by V.Sergeev on 13/04/2019.
//  Copyright © 2019 v.sergeev.m@icloud.com. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    // Отвечает за заднее поле экрана background animation
    var starfield:SKEmitterNode!
    // Создаем игрока, он не анимация а значет SKSpriteNone!
    var player:SKSpriteNode!
    // Создаем переменую под вывод текста на экране
    var scoreLabel:SKLabelNode!
    
    var score:Int = 0 {
        // добавляем текст на экран
        didSet {
            scoreLabel.text = "Счет: \(score)"
        }
    }
    
    override func didMove(to view: SKView) {
        // создаем переменную анимации заднего поля(звезд)
        starfield = SKEmitterNode(fileNamed: "Starfield")
        // создаем позицию поля, расположение: 1472 прокрывает площадь всех айфонов 6/7/8/10?
        starfield.position = CGPoint(x: 0, y: 1472)
        // создаем задержку для экрана, для отображения на экране всех звезд, а не первую анимацию появления
        starfield.advanceSimulationTime(10)
        // добавляем на экран
        self.addChild(starfield)
        
        // устанваливаем наш фон так, чтобы он был всегда последним с низу слоев
        starfield.zPosition = -1
        
        // добавляем игрока
        player = SKSpriteNode(imageNamed: "shuttle")
        // указываем позицию игрока X: 0 - нулевая позиция экрана, Y: -300 - опущен на -300 по отношению к верхнему экрану
        player.position = CGPoint(x: 0, y: -200)
        
        self.addChild(player)
        
        // добавление физики
        // отключаем отключаем гравитацию
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        // отслеживаем соприкосновения в игре, добавляем в class GameScene SKPhysicsContactDelegate
        self.physicsWorld.contactDelegate = self
        
        // Добавляем характеристики для scoreLabel
        scoreLabel = SKLabelNode(text: "Счет: 0")
        // Устанавливаем характеристики для шрифта можно найти по iOS fonts
        scoreLabel.fontName = "AmericanTypewriter-Bold"
        // устанавливаем размер шрифта
        scoreLabel.fontSize = 36
        // устанавливаем цвет шрифта  - белый
        scoreLabel.fontColor = UIColor.white
        // устанавливаем позицию текста, берем выстоту и ширину экрана self.frame.size.height и отнимаем 60
        //scoreLabel.position = CGPoint(x: -200, y: self.frame.size.height - 100)
        scoreLabel.position = CGPoint(x: -300, y: 625)
        // обознаваем score как 0 при старте игры
        score = 0
        // Добавляем scoreLaberl на экран
        self.addChild(scoreLabel)
        }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
