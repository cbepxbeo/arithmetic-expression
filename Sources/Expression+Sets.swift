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
 |  File: Expression+Sets.swift
 |  Created by: Egor Boyko
 |  Date: November 2, 2024
 |---------------------------------------------------------------------------------------
 
 */

//MARK: Single
extension Expression {
    ///Получение масива примеров из однозначных чисел с указанным оператором
    /// - Parameter operator: Оператор, который используется в примерах
    /// - Returns: Возвращает все возможные однозначные примеры
    static func single(operator: Operator) -> [Expression] {
        var result: [Expression] = []
        for i in 1...9{
            for j in (1...9).reversed() {
                try! result.append(Expression(left: Element(i), right: Element(j), operator: `operator`))
            }
        }
        return result
    }
}

//MARK: SingleWithTwoDigit
extension Expression {
    ///Получение масива примеров из однозначных чисел с указанным оператором
    /// - Parameter operator: Оператор, который используется в примерах
    /// - Returns: Возвращает все возможные однозначные + двухзначные примеры
    static func singleWithTwoDigit(operator: Operator) -> [Expression] {
        []
    }
}
