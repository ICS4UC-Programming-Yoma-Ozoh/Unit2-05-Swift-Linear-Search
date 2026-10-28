import Foundation

/**
 * Generates an array of random sorted numbers and performs
 * a linear search based on user input.
 *
 * @author  Yoma Ozoh
 * @version 1.0
 * @since   2026-10-28
 */

// Linear Search function matching your pseudocode logic
func linearSearch(num: Int, array: [Int]) -> Int {
    for index in 0..<array.count {
        if array[index] == num {
            return index // Return the index where the number is found
        }
    }
    return -1 // Return -1 if the number is not in the list
}

func main() {
    var keepPlaying = true

    while keepPlaying {
        // Generate array of 10 random integers between 0 and 100
        var numbers = [Int]()
        for _ in 0..<10 {
            numbers.append(Int.random(in: 0...100))
        }

        // Sort the array
        numbers.sort()

        // Display instructions and print the sorted array
        print("What number are you searching for in the list below? Enter \"q\" to quit.")
        for number in numbers {
            print("\(number) ", terminator: "")
        }
        print("\tNumber: ", terminator: "")

        // Read input
        if let inputString = readLine()?.trimmingCharacters(in: .whitespacesAndNewlines) {
            
            // Check if the user wants to quit
            if inputString.lowercased() == "q" {
                print("Thank you for playing!")
                keepPlaying = false
            } else {
                // Safely attempt to parse input string to an integer
                if let userNum = Int(inputString) {
                    let foundIndex = linearSearch(num: userNum, array: numbers)

                    if foundIndex == -1 {
                        print("The number \(userNum) is not found in the list of numbers.\n")
                    } else {
                        print("The number \(userNum) is found at index \(foundIndex).\n")
                    }
                } else {
                    print("Please input a valid integer.\n")
                }
            }
        }
    }
}

// Execute the main program
main()