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
 |  File: SetGenerationTests.swift
 |  Created by: Egor Boyko
 |  Date: November 2, 2024
 |---------------------------------------------------------------------------------------
 
 */

import XCTest
@testable import ArithmeticExpression

typealias Expression = ArithmeticExpression.Expression<Int>

final class SetGenerationTests: XCTestCase {
    func testSinglePlus() throws {
        let expressions = Expression.make(classifier: .single, operator: .plus)
        var bool = true
        //Коллекция не должна содержать значения менее 1-го и более 9-ти
        expressions.forEach { element in
            if element.left < 1 || element.right < 1 || element.left > 9 || element.right > 9 {
                bool = false
            }
        }
        XCTAssert(bool)
        let set = Set<Expression>(expressions)
        //2 вариант, 8 элементов от 1-го до 9-ти во второй степени
        XCTAssert(expressions.count != 8 * 8)
        //Множество не должно содержать дубликатов (перестановка слагаемых)
        XCTAssert(expressions.count != 8 * 8 / 2)
        
    }
    func testSingleWithTwoDigit() throws {}
}
