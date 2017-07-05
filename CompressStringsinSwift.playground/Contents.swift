//: Playground - noun: a place where people can play

import UIKit

func compressedString(_ input: String) -> String {
    var hashMap = [Character: Int]()
    var output = ""
    var last: Character!

    // empty string == exit
    if input.characters.count == 0 {
        return output
    }

    for current in input.characters {
        // current exists in the dictionary
        // increament count
        if hashMap[current] != nil {
            if let val = hashMap[current] {
                hashMap[current] = val + 1
            }
        } else {
            // doesnt exist in the dictionary
            // add it to the dictionary
            hashMap[current] = 1
        }
        // last is not initialized with any character
        // hence a nil check is needed and only append to 
        // output string if last is different from current
        if (last != nil && last != current) {
            if let val = hashMap[last] {
                if val > 1 {
                    //append count only if the count > 1
                    output = output + String(last) + String(val)
                } else {
                    //else display the char
                    output = output + String(last)
                }
            }
        }
        last = current
    }
    // before exiting last will be current and it has to be appended
    if let val = hashMap[last] {
        if val > 1 {
            output = output + String(last) + String(val)
        } else {
            output = output + String(last)
        }
    }

    return output
}
print(compressedString("AABCD"))
