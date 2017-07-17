import UIKit

let gameOfThrones = [["Arya","Bran","Sansa"],["Tyrion","Cersei","Jaime"],["Daenerys","Viserys","Aerys"]]

func printNeighboursOfEachElement(_ house: [[String]]) {
    for r in 0..<house.count  {
        for c in 0..<house[0].count {
            print("\n")
            print("\(house[r][c])'s neighbours are:")
            for l in -1...1 {
                for k in -1...1 {
                    if (r+k) >= 0 && (c+l) >= 0
                        && r+k < house.count
                        && c+l < house[0].count {
                        if house[r][c] != house[r+k][c+l] {
                            print(house[r+k][c+l])
                        }
                    }
                }
            }
        }
    }
}


printNeighboursOfEachElement(gameOfThrones)