import Foundation

class RandomIndexGenerator {
    private var d = [Int]()
    private var r = [Int]()
    private let key = 3

    func generateRandomIndex() -> Int {
        if d.count == r.count {
            d.removeAll()
        }
        let random = Int(arc4random_uniform(UInt32(r.count)))
        if d.contains(random) {
            return generateRandomIndex()
        } else {
            d.append(random)
        }
        return r[random]
    }

    func hydrateReservoir(_ array: [Int]) {
        for i in 0..<a.count {
            if key == a[i] {
                r.append(i)
            }
        }
    }
}

private let a = [1,2,3,3,3]
let r = RandomIndexGenerator()
r.hydrateReservoir(a)
print(r.generateRandomIndex())
print(r.generateRandomIndex())
print(r.generateRandomIndex())
print(r.generateRandomIndex())
print(r.generateRandomIndex())
print(r.generateRandomIndex())
