import UIKit

// Struct 10 pts
// Generics 10 pts

/* A struct provides the structure for a specific class.
 */

struct Point<T>{
    
    var xPosition:Double?
    var yPosition:Double?
    var reference:T?
    
    init(_ newXPosition:Double, _ newYPosition:Double, _ nReference:T){
        self.xPosition = newXPosition
        self.yPosition = newYPosition
        self.reference = nReference
    }
    
    // Subscript 20pts
    /*
     Euclidean distance formula
     The Euclidean distance between two points in either the plane or 3-dimensional space measures the length of a segment connecting the two points. It is the most obvious way of representing distance between two points.
     
     The Pythagorean Theorem can be used to calculate the distance between two points, as shown in the figure below. If the points (x1,y1) and (x2,y2) are in 2-dimensional space, then the Euclidean distance between them is 
     dist((x, y), (a, b)) = √(x - a)² + (y - b)²
     */
    
    subscript(_ currentXPosition:Double, _ currentYPosition:Double) -> Double {
        get {
            let distance:Double = sqrt((pow((currentXPosition - xPosition!), 2) + pow(currentYPosition - yPosition!, 2)))
            return distance
        }
        
        
    }
}

// Enum type to define my Errors
enum pointError: Error{
    case noPointsWereFound
}
/*
 This is the way in which I'm retrieving the points and storing them in a different array
 */

func getPoints(list listOfPoints:[Point<String>],point currPosition:Point<String>, radius:Double) throws -> [Point<String>] {
    
    if radius == 0 {
    
        throw pointError.noPointsWereFound
    }
    
    var finalList = [Point<String>]()
    
    for (index, point) in listOfPoints.enumerated() {
        
        
        let valueCalculatedDistance:Double = listOfPoints[index][currPosition.xPosition!,currPosition.yPosition!]
        
        
        if( valueCalculatedDistance < radius){
            finalList.append(point)}
            
            
        }
            //
            //        print(finalList[index][currPosition.placeXPoint!,currPosition.placeYPoint!])
            //        print(index)
    
    return finalList
}

// Testing
var list = [Point<String>]()
list.append(Point<String>(0, 0, "Example 1"))
list.append(Point<String>(1, 1, "Example 2"))
list.append(Point<String>(2, 2, "Example 3"))


var definedOrigin = Point<String>(0, 0, "MY PLACE")
var givenRadio:Double = 0

// Exception Handling
do {
    try getPoints(list: list, point: definedOrigin, radius: givenRadio)
} catch pointError.noPointsWereFound{
    print("No points were found")
}

