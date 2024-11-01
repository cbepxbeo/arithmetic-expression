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
 |  File: Expression+Initializer.swift
 |  Created by: Egor Boyko
 |  Date: October 30, 2024
 |---------------------------------------------------------------------------------------
 
 */

extension Expression {
    public init(left: Element, right: Element, operator oper: Operator) throws where Element : BinaryInteger {
        self.classifier = try Self.getClassifier(left, right)
        self.left = left
        self.right = right
        self.operator = oper
        self.difficulty = Self.getDifficulty(left, right, self.classifier, oper)
    }
    public init(left: Element, right: Element, operator oper: Operator) throws where Element : BinaryFloatingPoint {
        self.classifier = try Self.getClassifier(left, right)
        self.left = left
        self.right = right
        self.operator = oper
        self.difficulty = Self.getDifficulty(left, right, self.classifier, oper)
    }
}


extension Expression {
    static func getClassifier(_ left: Element, _ right: Element) throws -> Classifier {
        switch (left, right) {
        case (0...10, 0...10): return .single
        default:
            throw Error.invalidExpression
        }
    }
    static func getDifficulty(
        _ left: Element,
        _ right: Element,
        _ classifier: Classifier,
        _ oper: Operator) -> Difficulty where Element : BinaryInteger {
            switch classifier {
            case .single:
                Self.getSingleDifficulty(left, right, oper)
            }
        }
    static func getDifficulty(
        _ left: Element,
        _ right: Element,
        _ classifier: Classifier,
        _ oper: Operator) -> Difficulty where Element : BinaryFloatingPoint {
            switch classifier {
            case .single:
                Self.getSingleDifficulty(left, right, oper)
            }
        }
}


extension Expression {
    static func getSingleDifficulty(_ left: Element, _ right: Element, _ oper: Operator) -> Difficulty where Element : BinaryInteger {
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
    static func getSingleDifficulty(_ left: Element, _ right: Element, _ oper: Operator) -> Difficulty where Element : BinaryFloatingPoint {
        let x = Int(left)
        let y = Int(right)
        return Expression<Int>.getSingleDifficulty(x, y, oper)
    }
}
