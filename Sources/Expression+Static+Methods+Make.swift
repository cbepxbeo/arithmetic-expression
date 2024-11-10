/*
 
 |---------------------------------------------------------------------------------------
 |  Copyright The Arithmetic-expression Contributors.
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
}
