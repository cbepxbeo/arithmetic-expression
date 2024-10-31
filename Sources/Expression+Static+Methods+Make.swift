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

extension Expression where Element: BinaryInteger {
    ///Получение массива примеров заданной классификации, с заданным оператором
    /// - Parameter operator: Оператор, который используется в примерах
    /// - Parameter classifier:  Классификатор примера (однозначиные числа, двузначные и т.д.)
    /// - Returns: Возвращает все возможные примеры исходя из заданных параметров
    public static func make(classifier: Classifier, operator: Operator) -> [Expression] {
        switch classifier {
        case .single:
            return Self.single(operator: `operator`)
        }
    }
    
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
        extraHard: UInt? = nil,
        hard: UInt? = nil,
        medium: UInt? = nil,
        easy: UInt? = nil) -> Set<Expression> {

            var dic: [Difficulty: [Expression]] = [
                .easy: [],
                .medium: [],
                .hard: [],
                .extraHard: []
            ]
            var result: Set<Expression> = []

            items.forEach {
                dic[$0.difficulty]?.append($0)
            }
            
            if let easy, let items = dic[.easy] {
                assembly(items: items, necessary: easy, input: &result)
            }
            if let medium, let items = dic[.medium] {
                assembly(items: items, necessary: medium, input: &result)
            }
            if let hard, let items = dic[.hard] {
                assembly(items: items, necessary: hard, input: &result)
            }
            
            if let extraHard, let items = dic[.extraHard] {
                assembly(items: items, necessary: extraHard, input: &result)
            }
            
            func assembly(items: [Expression], necessary: UInt, input: inout Set<Expression>){
                let startCount = input.count
                let maxPossibleQuantity = Set<Expression>(items).count
                let required = min(Int(necessary), maxPossibleQuantity)
                while input.count < startCount + required {
                    if let random = items.randomElement() {
                        input.insert(random)
                    }
                }
            }
            
            return result
    }
}
