import UIKit

// We can just use the .sorted function, it isnt the fastest solution
// In this first function we have found a solution but it doesnt account for the case that we have negative numbers in our initial array; So it doesnt really answer the question
// We will be using the pointer system
// the square function is a helper function that makes the code neater
// We cant just drop these into an array just soso with the append function
// we use the insert function to place the output of the square function at a specific Index

var Array = [-20,-2,1,2,3,5,6,8,9,30]
var expected = [1,4,4,9,25,36,64,81,400,900]

// This may seem simple but we need to take care of carrtain edge cases
// These include negative numbers and empty arrays
// We need to include the absolute value of the number

class Program {
    func sortedSquareArray(_ array: [Int]) -> [Int] {
        
        var result = [Int]()
        
        var low = 0
        var high = array.count - 1
        
        for _ in 0..<array.count {
            let firstElement = abs(array[low])
            let lastElement = abs(array[high])
         
            if lastElement > firstElement {
                result.insert(square(element: lastElement), at: 0)
                high -= 1
            } else {
                result.insert(square(element: firstElement), at: 0)
                low += 1
            }
        }
        
        return result
    }
    
    private func square(element: Int) -> Int {
       return element * element
    }
}


let result = Program().sortedSquareArray(Array)
print(result == expected ? "Pass" : "Fail")
