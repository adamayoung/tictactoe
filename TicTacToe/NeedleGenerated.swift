

import Foundation
import GameFeature
import LoginFeature
import NeedleFoundation
import SwiftUI
import WelcomeFeature
import NeedleFoundation

// swiftlint:disable unused_declaration
private let needleDependenciesHash : String? = nil

// MARK: - Traversal Helpers

private func parent1(_ component: NeedleFoundation.Scope) -> NeedleFoundation.Scope {
    return component.parent
}

// MARK: - Providers

#if !NEEDLE_DYNAMIC

private class WelcomeNavigationStackDependency9eaba309e2a5684b7791Provider: WelcomeNavigationStackDependency {


    init() {

    }
}
/// ^->RootComponent->WelcomeNavigationStackComponent
private func factoryfbfa89c45b9638796fdfe3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return WelcomeNavigationStackDependency9eaba309e2a5684b7791Provider()
}
private class GameDependency6174651c56123eef7457Provider: GameDependency {


    init() {

    }
}
/// ^->RootComponent->GameComponent
private func factory0d685c4234534fafd098e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return GameDependency6174651c56123eef7457Provider()
}
private class WelcomeDependency857247f8eda50cf4e055Provider: WelcomeDependency {


    init() {

    }
}
/// ^->RootComponent->WelcomeNavigationStackComponent->WelcomeComponent
private func factory03eda1c6bf446afa72dce3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return WelcomeDependency857247f8eda50cf4e055Provider()
}
private class LoginDependency6ba28b962526616519f8Provider: LoginDependency {


    init() {

    }
}
/// ^->RootComponent->WelcomeNavigationStackComponent->LoginComponent
private func factory2ffadd82733649c43eb1e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return LoginDependency6ba28b962526616519f8Provider()
}

#else
extension RootComponent: NeedleFoundation.Registration {
    public func registerItems() {


    }
}
extension WelcomeNavigationStackComponent: NeedleFoundation.Registration {
    public func registerItems() {


    }
}
extension GameComponent: NeedleFoundation.Registration {
    public func registerItems() {

    }
}
extension WelcomeComponent: NeedleFoundation.Registration {
    public func registerItems() {

    }
}
extension LoginComponent: NeedleFoundation.Registration {
    public func registerItems() {

    }
}


#endif

private func factoryEmptyDependencyProvider(_ component: NeedleFoundation.Scope) -> AnyObject {
    return EmptyDependencyProvider(component: component)
}

// MARK: - Registration
private func registerProviderFactory(_ componentPath: String, _ factory: @escaping (NeedleFoundation.Scope) -> AnyObject) {
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: componentPath, factory)
}

#if !NEEDLE_DYNAMIC

@inline(never) private func register1() {
    registerProviderFactory("^->RootComponent", factoryEmptyDependencyProvider)
    registerProviderFactory("^->RootComponent->WelcomeNavigationStackComponent", factoryfbfa89c45b9638796fdfe3b0c44298fc1c149afb)
    registerProviderFactory("^->RootComponent->GameComponent", factory0d685c4234534fafd098e3b0c44298fc1c149afb)
    registerProviderFactory("^->RootComponent->WelcomeNavigationStackComponent->WelcomeComponent", factory03eda1c6bf446afa72dce3b0c44298fc1c149afb)
    registerProviderFactory("^->RootComponent->WelcomeNavigationStackComponent->LoginComponent", factory2ffadd82733649c43eb1e3b0c44298fc1c149afb)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}
