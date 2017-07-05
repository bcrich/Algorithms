//: Playground - noun: a place where people can play

class GameOfLife {
    init(_ grid: [[Int]], _ m: Int, _ n: Int) {
        print("original Generation")
        printCellularGenerationSimulation(grid, m, n)

        print("Next Generation")
        let next = nextGeneration(grid, m, n)
        printCellularGenerationSimulation(next, m, n)
    }

    func nextGeneration(_ grid: [[Int]], _ m: Int, _ n: Int) -> [[Int]] {
        var future = grid
        for l in 1..<m - 1 {
            for k in 1..<n - 1 {
                var alive = 0
                for i in -1...1 {
                    for j in -1...1 {
                        alive += grid[i+l][k+j]
                    }
                }
                alive -= grid[l][k]
                if grid[l][k] == 1 && alive < 2 {
                    future[l][k] = 0
                } else if grid[l][k] == 1 && alive > 3 {
                    future[l][k] = 0
                } else if grid[l][k] == 0 && alive == 3 {
                    future[l][k] = 1
                } else {
                    future[l][k] = grid[l][k]
                }
            }
        }
        return future
    }

    func printCellularGenerationSimulation(_ grid: [[Int]], _ m: Int, _ n: Int) {
        for i in 0..<m {
            for j in 0..<n {
                if grid[i][j] == 0 {
                    print(".", terminator:"")
                } else {
                    print("*", terminator:"")
                }
            }
            print()
        }
    }
}

let grid = [[0,0,0,0,0,0,0,0,0,0],
            [0,0,0,1,1,0,0,0,0,0],
            [0,0,0,0,1,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0],
            [0,0,0,1,1,0,0,0,0,0],
            [0,0,1,1,0,0,0,0,0,0],
            [0,0,0,0,0,1,0,0,0,0],
            [0,0,0,0,1,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0]]

let gameOfLife = GameOfLife(grid, 10, 10)