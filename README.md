# QuickServiceLocator

[![Swift](https://github.com/frankois944/QuickServiceLocator/actions/workflows/swift.yml/badge.svg)](https://github.com/frankois944/QuickServiceLocator/actions/workflows/swift.yml)

A quick service locator for the Apple platform, made to be the easiest and simplest way to use

## Installation

Swift package manager 

`https://github.com/frankois944/QuickServiceLocator.git`

## The quick way

### Register/resolve from a property wrapper

```swift
// registering and resolving
@QuickSL(register: DummyService())
var dummyService: DummyServiceProtocol
// even
@QuickSL(register: DummyService())
var dummyTest2: DummyService
// only resolving
@QuickSL var dummyService: DummyServiceProtocol
```

### or

```swift
// registering
QuickServiceLocator.register(DummyServiceProtocol.self, DummyService())
// resolving
let instance: DummyServiceProtocol = QuickServiceLocator.locate()
```

### Unregister the service

```swift
QuickServiceLocator.unregister(DummyServiceProtocol.self)
```

### Check the presence of the service

```swift
QuickServiceLocator.isRegister(DummyServiceProtocol.self)
```

## Behavior

By default, every services are registered in a `lazySharedInstance` mode, it means the `DummyService` will be created during the resolving step as a singleton.

This behavior can be set during the registering step.

```swift
@QuickSL(register: DummyService(), mode: .newInstance)
var dummyService: DummyServiceProtocol
// or
QuickServiceLocator.register(DummyServiceProtocol.self,
                                mode: .newInstance,
                                DummyService())
```



