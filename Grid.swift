//
//  Grid.swift
//  gameoflife
//
//  Created by Frank Joseph Boccia on 6/25/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

let GridRows = 8
let GridColumns = 10

class Grid: CCSprite {
    var totalAlive = 0
    var generation = 0
    
    var cellWidth: CGFloat = 0
    var cellHeight: CGFloat = 0
    var gridArray: [[Creature]]!
    
    // Add Grid methods below here
    
    override func onEnter() {
        super.onEnter()
        
        setupGrid()
        
        userInteractionEnabled = true
    }
    func setupGrid() {
        
        cellWidth = contentSize.width / CGFloat(GridColumns)
        cellHeight = contentSize.height / CGFloat(GridRows)
        
        gridArray = []
        
        for row in 0..<GridRows {
            gridArray.append([])
            
            for column in 0..<GridColumns {
                var creature = Creature()
                creature.position = CGPoint(x: cellWidth * CGFloat(column),
                    y: cellHeight * CGFloat(row))
                addChild(creature)
                
                gridArray[row].append(creature)
                
                creature.isAlive = false
            }
        }
        
    }
    override func touchBegan(touch: CCTouch!, withEvent event: CCTouchEvent!) {
        var touchLocation = touch.locationInNode(self)
        
        var creature = creatureForTouchPosition(touchLocation)
        
        creature.isAlive = !creature.isAlive
    }
    func creatureForTouchPosition(touchPosition: CGPoint) -> Creature {
        var row = Int(touchPosition.y / cellHeight)
        var column = Int(touchPosition.x / cellWidth)
        return gridArray[row][column]

    }
   
    
}