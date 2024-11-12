/*
 
 |---------------------------------------------------------------------------------------
 |  Copyright The Arithmetic-expression Contributors.
 |---------------------------------------------------------------------------------------
 |  File: RandomConfiguration.swift
 |  Created by: Egor Boyko
 |  Date: November 12, 2024
 |---------------------------------------------------------------------------------------
 
 */

public protocol RandomConfiguration: Configuration {
    var easy: UInt { get set }
    var medium: UInt { get set }
    var hard: UInt { get set }
    var extraHard: UInt { get set }
}
