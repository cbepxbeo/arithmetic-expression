/*
 
 |---------------------------------------------------------------------------------------
 |  Copyright The Arithmetic-expression Contributors.
 |---------------------------------------------------------------------------------------
 |  File: Expression+Static+Methods+MakeRandom.swift
 |  Created by: Egor Boyko
 |  Date: November 10, 2024
 |---------------------------------------------------------------------------------------
 
 */

import ArithmeticFoundation
import ArithmeticExpressionGenerator

extension Expression {
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
