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
 |  File: Expression+Static+Methods+Make.swift
 |  Created by: Egor Boyko
 |  Date: October 30, 2024
 |---------------------------------------------------------------------------------------
 
 */

import ArithmeticFoundation
import ArithmeticExpressionGenerator

extension Expression {
    ///Получение множества случайных примеров исходя из указанной желаемой сложности.
    /// - Parameter items: Массив примеров, из которого будет формироваться множество
    /// - Parameter extraHard: Желаемое кол-во примеров максимальной сложности
    /// - Parameter hard: Желаемое кол-во примеров повышенной сложности
    /// - Parameter medium: Желаемое кол-во примеров обычной сложности
    /// - Parameter easy: Желаемое кол-во примеров обычной сложности
    /// - Returns: Возвращает множество примеров. Если не переданны параметры желаемого кол-ва или желаемые
    ///            примеры отсутствуют, будет возвращено пустое множество.
    /// - Note: Нет гарантии, что количество возвращаемых примеров совпадет с запросом т.к. при указании желаемого
    ///         резултата, возможен вариант, что примеров будет меньше или их не содержится вообще. В таком случае,
    ///         множество будет содержать все возможные примеры. Например, передавая на вход полный массив
    ///         примеров с однозначным классификатором, оператором плюс и параметром extraHard = 50, мы получим
    ///         масимальное возможно кол-во примеров(3).
    public static func make(
        items: [Expression],
        classifier: ArithmeticFoundation.Classifier,
        operator: ArithmeticFoundation.Operator,
        mode: ArithmeticFoundation.Mode) -> Set<Expression> {
            []
    }
}
