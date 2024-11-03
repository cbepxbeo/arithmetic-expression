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
        //Коллекция не должна содержать значения менее 1-го и более 9-ти
        expressions.forEach { element in
            if element.left < 1 || element.right < 1 || element.left > 9 || element.right > 9 {
                XCTFail()
            }
        }
        
        //2 варианта, 9 элементов, от 1-го до 9-ти, 9 во второй степени
        XCTAssert(expressions.count == 9 * 9)
        
        //Множество, чтобы исключить дубликаты
        let set = Set<Expression>(expressions)
        //Колbчество = арифметическая прогрессия от 1 до 9 с шагом 1
        XCTAssert(set.count == ((9 + 1) / 2) * 9)
        
    }
    
    func testSingleWithTwoDigit() throws {
        let expressions = Expression.make(classifier: .singleWithTwoDigit, operator: .plus)
        //Коллекция не должна содержать два значения менее 1-го и более 9-ти,
        //два значения более 10, значения более 99 и менее 1
        expressions.forEach { element in
            let max = max(element.left, element.right)
            let min = min(element.left, element.right)
            if max < 9 || max > 99 || min < 1 || min > 10 {
                XCTFail()
            }
        }
        //Варианты 1...9 справа и 10...99 слева, 10...99 справа и 1...9 слева
        XCTAssert(expressions.count == (9 * 90) * 2)
        //Множество, чтобы исключить дубликаты
        //Так как левая и правая часть не имеют коллизий, достаточно просто всех вариантов
        //с одной стороны
        let set = Set<Expression>(expressions)
        XCTAssert(set.count == 9 * 90)
    }
}
