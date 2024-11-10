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
    ///Получение множества примеров исходя из режима.
    /// - Parameter classifier: Классификатор примеров
    /// - Parameter operator: Оператор примеров
    /// - Parameter mode: Режим генерации примеров
    /// - Returns: Возвращает множество примеров. .
    public static func make(
        classifier: ArithmeticFoundation.Classifier,
        operator: ArithmeticFoundation.Operator,
        mode: ArithmeticFoundation.Mode) -> Set<Expression> {
            switch mode {
            case .random:
                Self.makeRandom(classifier: classifier, operator: `operator`)
            case .selectively:
                []
            case .nBack:
                []
            }
    }
    
    
    static func makeRandom(
        classifier: ArithmeticFoundation.Classifier,
        operator: ArithmeticFoundation.Operator) -> Set<Expression> {
            func assembly(difficulty: Difficulty, required: Int, input: inout Set<Expression>){
                let startCount = input.count
                while input.count < startCount + required {
                    let random = Generator.random(
                        difficulty: difficulty,
                        classifier: classifier,
                        operator: `operator`
                    )
                    input.insert(
                        Expression(
                            left: Element(random.0),
                            right: Element(random.1),
                            operator: `operator`
                        )
                    )
                }
            }
            var output: Set<Expression> = []
            
            assembly(difficulty: .extraHard, required: 2, input: &output)
            assembly(difficulty: .hard, required: 3, input: &output)
            assembly(difficulty: .medium, required: 3, input: &output)
            assembly(difficulty: .easy, required: 2, input: &output)
            
            return output
    }
    
    
}
