/*
 
 |---------------------------------------------------------------------------------------
 |  Copyright The Arithmetic-expression Contributors.
 |---------------------------------------------------------------------------------------
 |  File: Expression.swift
 |  Created by: Egor Boyko
 |  Date: October 30, 2024
 |---------------------------------------------------------------------------------------
 
 */

import ArithmeticFoundation

public struct Expression<Element: Calculated>: ArithmeticFoundation.Expression  {
    public init(left: Element, right: Element, operator: Operator){
        self.left = left
        self.right = right
        self.operator = `operator`
    }
    public let left: Element
    public let right: Element
    public let `operator`: Operator
}
