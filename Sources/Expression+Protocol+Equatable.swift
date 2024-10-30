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
 |  File: Expression+Protocol+Equatable.swift
 |  Created by: Egor Boyko
 |  Date: October 30, 2024
 |---------------------------------------------------------------------------------------
 
 */

extension Expression: Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        let lhsMax = max(lhs.left, lhs.right)
        let rhsMax = max(rhs.left, rhs.right)
        let lhsMin = min(lhs.left, lhs.right)
        let rhsMin = min(rhs.left, rhs.right)
        
        return lhsMax == rhsMax && lhsMin == rhsMin && lhs.operator == rhs.operator
    }
}
