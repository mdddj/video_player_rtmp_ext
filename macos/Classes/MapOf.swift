//
//  MapOf.swift
//  Pods
//
//  Created by ldd on 2025/9/8.
//

infix operator =>

public func => <K,V>(key: K,value: V) -> (K,V){
    return (key,value)
}

public func mapOf<K,V>(_ pairs: (K,V)...)->[K,V]{
    return Dictionary(uniqueKeysWithValues: pairs)
}


