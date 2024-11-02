/*
 
 |---------------------------------------------------------------------------------------
 |  Copyright The Arithmetic-expression Contributors.
 |  Licensed under the Apache License, Version 2.0 (the "License");
 |  you may not use this file except in compliance with the License.
 |  You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
 |
 |  Unless required by applicable law or agreed to in writing, software
 |  distributed under the License is distributed on an "AS IS" BASIS,
 |  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 |  See the License for the specific language governing permissions and
 |  limitations under the License.
 |---------------------------------------------------------------------------------------
 |  File: Expression+Difficulty.swift
 |  Created by: Egor Boyko
 |  Date: November 2, 2024
 |---------------------------------------------------------------------------------------
 
 */


//MARK: SINGLE
extension Expression {
    static func getSingleDifficulty(
        _ left: Element,
        _ right: Element,
        _ oper: Operator
    ) -> Difficulty {
        switch oper {
        case .plus:
            return plus(left, right)
        }
        func plus(_ x: Element, _ y: Element) -> Difficulty {
            if x == 1 || y == 1 {
                return .easy
            }
            
            if x == 2 || y == 2 {
                return .easy
            }
            
            if x == 9 || y == 9 {
                return .medium
            }
            
            if (x + y) % 10 == 0{
                return .easy
            }
            
            if x < 4 && y < 4 {
                return .easy
            }
            
            if x == y {
                return .medium
            }
            
            let max = max(x, y)
            let min = min(x, y)
            
            
            if max == 8 && min == 5 {
                return .extraHard
            }
            if max == 8 && min == 6 {
                return .extraHard
            }
            if max == 8 && min == 7 {
                return .extraHard
            }
            
            
            if max == 7 && min == 6 {
                return .hard
            }
            
            if max == 7 && min == 5 {
                return .hard
            }
            if max == 7 && min == 4 {
                return .hard
            }
            
            return .medium
        }
    }
}

//MARK: SingleWithTwoDigit
extension Expression {
    static func getSingleWithTwoDigitDifficulty(
        _ left: Element,
        _ right: Element,
        _ oper: Operator
    ) -> Difficulty {
        return .medium
    }
}
