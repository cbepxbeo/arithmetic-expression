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
 |  File: Expression+Method+GetClassifier.swift
 |  Created by: Egor Boyko
 |  Date: November 2, 2024
 |---------------------------------------------------------------------------------------
 
 */

extension Expression {
    static func getClassifier(_ left: Element, _ right: Element) throws -> Classifier {
        switch (left, right) {
        case (1...9, 1...9): return .single
        case (1...9, 10...99): return .singleWithTwoDigit
        case (10...99, 1...9): return .singleWithTwoDigit
        default:
            throw Error.invalidExpression
        }
    }
}
