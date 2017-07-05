//l1: Top Left coordinate of first rectangle.
//r1: Bottom Right coordinate of first rectangle.
//l2: Top Left coordinate of second rectangle.
//r2: Bottom Right coordinate of second rectangle.

//Note: This follows the cartesian coordinate system

class Point {
    var x: Int
    var y: Int

    init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }
}

class OverlapRectangles {
    func isOverlap(_ l1: Point, _ r1: Point, _ l2: Point, _ r2: Point ) -> Bool {
        // if one of the rectangles is to the left or right
        if r1.x < l2.x ||  l1.x > r1.x {
            return false
        }
        // if one of the rectangles is above or below
        if l1.y < r2.y || r1.y > l2.y {
            return false
        }

        return true
    }
}


let l1 = Point(0, 10)
let r1 = Point(10, 0)
let l2 = Point(5, 5)
let r2 = Point(15, 0)


let rectangles = OverlapRectangles()
rectangles.isOverlap(l1, r1, l2, r2)