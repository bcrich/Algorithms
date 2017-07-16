// rotate a matrix in place
// to rotate a matrix in place, first transpose the matrix
// then for clockwise reverse row elements
// for anticlock wise reverse column elements

func rotateClockWise(_ matrix: inout [[Int]]) -> [[Int]] {
    let row = matrix.count
    let col = matrix[0].count

    print("original matrix \n")
    printMatrix(matrix)

    // transpose the matrix
    matrix = transposeMatrix(&matrix)
    print("transposed matrix \n")
    printMatrix(matrix)

    // reverse all the rows
    var cStart = 0
    var cEnd = col - 1
    var r = 0

    while r < row {
        while cEnd > cStart {
            let temp = matrix[r][cEnd]
            matrix[r][cEnd] = matrix[r][cStart]
            matrix[r][cStart] = temp
            cEnd -= 1
            cStart += 1
        }
        r += 1
        cStart = 0
        cEnd = col - 1
    }

    return matrix
}

func transposeMatrix(_ matrix: inout [[Int]]) -> [[Int]] {
    let row = matrix.count
    let col = matrix[0].count

    for r in 0..<row {
        for c in r..<col {
            let temp = matrix[r][c]
            matrix[r][c] = matrix[c][r]
            matrix[c][r] = temp
        }
    }

    return matrix
}

func printMatrix(_ matrix: [[Int]]) {
    for i in 0..<matrix.count {
        for j in 0..<matrix[0].count {
            print(matrix[i][j],  terminator: "    ")
        }
        print("\n")
    }
}

func rotateAntiClockWise(_ matrix: inout [[Int]]) -> [[Int]] {
    let row = matrix.count
    let col = matrix[0].count

    print("original matrix \n")
    printMatrix(matrix)

    // reverse columns
    var rStart = 0
    var rEnd = row - 1
    var c = 0

    // transpose the matrix
    matrix = transposeMatrix(&matrix)
    print("transposed matrix \n")
    printMatrix(matrix)

    while c < col {
        while rEnd > rStart {
            let temp = matrix[rStart][c]
            matrix[rStart][c] = matrix[rEnd][c]
            matrix[rEnd][c] = temp
            rEnd -= 1
            rStart += 1
        }
        c += 1
        rStart = 0
        rEnd = row - 1
    }
    return matrix
}

var matrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16]]
var rotatedMatrix = rotateClockWise(&matrix)
print("Rotate matrix clockwise \n")
printMatrix(rotatedMatrix)

var firstColReversed = rotateAntiClockWise(&matrix)
print("Rotate matrix anti-clockwise \n")
printMatrix(firstColReversed)





