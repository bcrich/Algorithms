func generaterPicks(_ n: String) -> [Int] {
    let count = n.characters.count
    var picks = [Int]()
    var i = 0

    //strings with lesser than 7 characters
    if count < 7 { return [] }

    // find the number of two digit picks
    var numOfTwoDigitNumbers = 0
    // if the number of characters greater than 14
    // we can have 7 different 2 digit numbers
    if count < 14  {
        numOfTwoDigitNumbers = count % 7
    } else {
        numOfTwoDigitNumbers = 7
    }
    // maintain a counter for two digit picks
    var twoDigitCounter = 0

    // iterate through the characters till we have 7 picks
    while i < count && picks.count < 7 {
        // generate 2 digit numbers based on the size of the input string
        if twoDigitCounter < numOfTwoDigitNumbers {
            //concatenate number strings
            let number = String(n[n.index(n.startIndex, offsetBy: i)]) + String(n[n.index(n.startIndex, offsetBy: i+1)])
            // if the Integer value is greater than the threshold
            // split the number and check if it exists in the result picks
            // if not insert it and go to iterate to remaining characters
            if Int(number)! > 59 {
                let first = String(n[n.index(n.startIndex, offsetBy: i)])
                if !picks.contains(Int(first)!) && picks.count < 7 {
                    picks.append(Int(first)!)
                }
                i += 1 // important to note that increment is done based on number of digits
            } else {
                if !picks.contains(Int(number)!) && picks.count < 7  {
                    picks.append(Int(number)!)
                    twoDigitCounter += 1
                    i += 2
                } else {
                    let first = String(n[n.index(n.startIndex, offsetBy: i)])
                    if !picks.contains(Int(first)!) && picks.count < 7 {
                        picks.append(Int(first)!)
                        i += 1
                    }
                }
            }
        } else {
            let number = String(n[n.index(n.startIndex, offsetBy: i)])
            if !picks.contains(Int(number)!) && picks.count < 7  {
                picks.append(Int(number)!)
            }
            i += 1
        }
    }
    return picks
}

let result = generaterPicks("4938532894754")
print(result)
if result.count != 7 {
    print("Couldn't generate 7 picks")
}






