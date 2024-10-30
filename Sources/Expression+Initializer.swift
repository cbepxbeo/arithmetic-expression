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
    public init(left: Int, right: Int, operator oper: Operator){
        self.classifier = Self.getClassifier(left, right)
        self.left = left
        self.right = right
        self.difficulty = Self.getDifficulty(left, right)
        self.operator = oper
    }
    
    static func getClassifier(_ left: Int, _ right: Int) -> Classifier {
        .single
    }
    static func getDifficulty(_ left: Int, _ right: Int) -> Difficulty {
        .easy
    }
}