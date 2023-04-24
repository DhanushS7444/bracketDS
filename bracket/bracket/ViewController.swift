//
//  ViewController.swift
//  bracket
//
//  Created by Dhanush S on 29/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let bracket = Bracket()
        print(bracket.check(elements: "{}{{()}}(()()()()())[][][][{}{}{}{}{}{}(]"))
    }
}

struct TOS<T> {
    var items = [T]()
    mutating func push(item: T) {
        items.append(item)
    }
    
    mutating func pop() -> T {
        items.removeLast()
    }
}

class Bracket {
    let firstBracketOpening = "("
    let firstBracketClosing = ")"
    let secondBracketOpening = "{"
    let secondBracketClosing = "}"
    let thirdBracketOpening = "["
    let thirdBracketClosing = "]"

    var obj = TOS<String>()
    public func check(elements: String) -> Bool {
        var isValid = false
        var countItems = obj.items.count
        for char in elements {
            if countItems == 0 {
                obj.push(item: String(char))
                countItems = countItems + 1
            } else if countItems > 0 {
                if (String(char)) == firstBracketOpening ||
                    (String(char)) == secondBracketOpening ||
                    (String(char)) == thirdBracketOpening {
                    self.obj.push(item: String(char))
                    countItems = countItems + 1
                } else if ((obj.items[countItems - 1] == firstBracketOpening) && (String(char)) == firstBracketClosing) ||
                            ((obj.items[countItems - 1] == secondBracketOpening) && (String(char)) == secondBracketClosing) ||
                            ((obj.items[countItems - 1] == thirdBracketOpening) && (String(char)) == thirdBracketClosing) {
                    obj.pop()
                    countItems = countItems - 1
                } else {
                    isValid = false
                    break
                }
            }
        }
        isValid = countItems == 0 ? true : false
        return isValid
    }
}




