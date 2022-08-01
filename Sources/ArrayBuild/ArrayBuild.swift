//
//  ArrayBuild.swift
//  ListDemo
//
//  Created by HumorousGhost on 2022/7/15.
//

import Foundation

public extension Array {
    /// Builds an array from an @ArrayBuilder closure. Use `Array.build` if you're running into ambiguity issues.
    init(@ArrayBuilder<Element> contents: () throws -> [Element]) rethrows {
        self = try contents()
    }
    
    /// Builds an array from an @ArrayBuilder closure. Provided in addition to `init(contents:)` to avoid ambiguity.
    static func build(@ArrayBuilder<Element> contents: () throws -> [Element]) rethrows -> Self {
        try Self(contents: contents)
    }
}

@resultBuilder
public enum ArrayBuilder<Element> {
    public typealias Expression = Element

    public typealias Component = [Element]

    public static func buildExpression(_ expression: Expression) -> Component {
        [expression]
    }

    public static func buildExpression(_ expression: Expression?) -> Component {
        expression.map({ [$0] }) ?? []
    }

    public static func buildBlock(_ children: Component...) -> Component {
        children.flatMap({ $0 })
    }

    public static func buildOptional(_ children: Component?) -> Component {
        children ?? []
    }

    public static func buildBlock(_ component: Component) -> Component {
        component
    }

    public static func buildEither(first child: Component) -> Component {
        child
    }

    public static func buildEither(second child: Component) -> Component {
        child
    }
    
    public static func buildArray(_ contents: [[Element]]) -> [Element] {
        Array(contents.joined())
    }
}
