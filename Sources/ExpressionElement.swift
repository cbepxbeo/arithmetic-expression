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
 |  File: ExpressionElement.swift
 |  Created by: Egor Boyko
 |  Date: October 31, 2024
 |---------------------------------------------------------------------------------------
 
 */

public protocol ExpressionElement:
    DivisibleNumeric,
    Hashable,
    SignedNumeric,
    AdditiveArithmetic,
    Comparable {
    init<T: BinaryInteger>(_ sourse: T)
}

extension Int8: ExpressionElement {}
extension Int16: ExpressionElement {}
extension Int32: ExpressionElement {}
extension Int64: ExpressionElement {}
extension Int: ExpressionElement {}
extension Double: ExpressionElement {}
extension Float: ExpressionElement {}
