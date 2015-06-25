import Foundation

class MainScene: CCNode {
    weak var grid : Grid!
    weak var populationLabel : CCLabelTTF!
    weak var generationLabel : CCLabelTTF!
    
    var timer = CCTimer()
    
    func play() {
        schedule("step", interval: 0.5)
    }
    
    func pause() {
        unschedule("step")
    }
    
    func step() {
       grid.evolveStep()
        
        generationLabel.string = "\(grid.generation)"
        populationLabel.string = "\(grid.totalAlive)"
    }
    
}

