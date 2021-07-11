//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap { Locale(identifier: $0) } ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)

  /// Find first language and bundle for which the table exists
  fileprivate static func localeBundle(tableName: String, preferredLanguages: [String]) -> (Foundation.Locale, Foundation.Bundle)? {
    // Filter preferredLanguages to localizations, use first locale
    var languages = preferredLanguages
      .map { Locale(identifier: $0) }
      .prefix(1)
      .flatMap { locale -> [String] in
        if hostingBundle.localizations.contains(locale.identifier) {
          if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
            return [locale.identifier, language]
          } else {
            return [locale.identifier]
          }
        } else if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
          return [language]
        } else {
          return []
        }
      }

    // If there's no languages, use development language as backstop
    if languages.isEmpty {
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages = [developmentLocalization]
      }
    } else {
      // Insert Base as second item (between locale identifier and languageCode)
      languages.insert("Base", at: 1)

      // Add development language as backstop
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages.append(developmentLocalization)
      }
    }

    // Find first language for which table exists
    // Note: key might not exist in chosen language (in that case, key will be shown)
    for language in languages {
      if let lproj = hostingBundle.url(forResource: language, withExtension: "lproj"),
         let lbundle = Bundle(url: lproj)
      {
        let strings = lbundle.url(forResource: tableName, withExtension: "strings")
        let stringsdict = lbundle.url(forResource: tableName, withExtension: "stringsdict")

        if strings != nil || stringsdict != nil {
          return (Locale(identifier: language), lbundle)
        }
      }
    }

    // If table is available in main bundle, don't look for localized resources
    let strings = hostingBundle.url(forResource: tableName, withExtension: "strings", subdirectory: nil, localization: nil)
    let stringsdict = hostingBundle.url(forResource: tableName, withExtension: "stringsdict", subdirectory: nil, localization: nil)

    if strings != nil || stringsdict != nil {
      return (applicationLocale, hostingBundle)
    }

    // If table is not found for requested languages, key will be shown
    return nil
  }

  /// Load string from Info.plist file
  fileprivate static func infoPlistString(path: [String], key: String) -> String? {
    var dict = hostingBundle.infoDictionary
    for step in path {
      guard let obj = dict?[step] as? [String: Any] else { return nil }
      dict = obj
    }
    return dict?[key] as? String
  }

  static func validate() throws {
    try intern.validate()
  }

  #if os(iOS) || os(tvOS)
  /// This `R.storyboard` struct is generated, and contains static references to 1 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    #endif

    fileprivate init() {}
  }
  #endif

  /// This `R.color` struct is generated, and contains static references to 1 colors.
  struct color {
    /// Color `AccentColor`.
    static let accentColor = Rswift.ColorResource(bundle: R.hostingBundle, name: "AccentColor")

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "AccentColor", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func accentColor(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.accentColor, compatibleWith: traitCollection)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "AccentColor", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func accentColor(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.accentColor.name)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.image` struct is generated, and contains static references to 3 images.
  struct image {
    /// Image `avatar-placeholder`.
    static let avatarPlaceholder = Rswift.ImageResource(bundle: R.hostingBundle, name: "avatar-placeholder")
    /// Image `empty-state-logo`.
    static let emptyStateLogo = Rswift.ImageResource(bundle: R.hostingBundle, name: "empty-state-logo")
    /// Image `gh-logo`.
    static let ghLogo = Rswift.ImageResource(bundle: R.hostingBundle, name: "gh-logo")

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "avatar-placeholder", bundle: ..., traitCollection: ...)`
    static func avatarPlaceholder(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.avatarPlaceholder, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "empty-state-logo", bundle: ..., traitCollection: ...)`
    static func emptyStateLogo(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.emptyStateLogo, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "gh-logo", bundle: ..., traitCollection: ...)`
    static func ghLogo(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.ghLogo, compatibleWith: traitCollection)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.info` struct is generated, and contains static references to 1 properties.
  struct info {
    struct uiApplicationSceneManifest {
      static let _key = "UIApplicationSceneManifest"
      static let uiApplicationSupportsMultipleScenes = false

      struct uiSceneConfigurations {
        static let _key = "UISceneConfigurations"

        struct uiWindowSceneSessionRoleApplication {
          struct defaultConfiguration {
            static let _key = "Default Configuration"
            static let uiSceneConfigurationName = infoPlistString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication", "Default Configuration"], key: "UISceneConfigurationName") ?? "Default Configuration"
            static let uiSceneDelegateClassName = infoPlistString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication", "Default Configuration"], key: "UISceneDelegateClassName") ?? "$(PRODUCT_MODULE_NAME).SceneDelegate"

            fileprivate init() {}
          }

          fileprivate init() {}
        }

        fileprivate init() {}
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }

  /// This `R.string` struct is generated, and contains static references to 1 localization tables.
  struct string {
    /// This `R.string.localizable` struct is generated, and contains static references to 17 localization keys.
    struct localizable {
      /// Value: Buscar seguidores
      static let searchFollowers = Rswift.StringResource(key: "searchFollowers", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Desculpe 😥 
      static let sorry = Rswift.StringResource(key: "sorry", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Desculpe! Encontramos um erro no decode.
      static let decodeError = Rswift.StringResource(key: "decodeError", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Digite o username
      static let enterUsername = Rswift.StringResource(key: "enterUsername", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Digite o username 🤖
      static let emptyUsername = Rswift.StringResource(key: "emptyUsername", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Hey!
      static let hello = Rswift.StringResource(key: "hello", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Não disponível
      static let notAvailable = Rswift.StringResource(key: "notAvailable", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Não encontramos seguidores 👣 . Que tal ser o primeiro ? 😁
      static let emptyFollowers = Rswift.StringResource(key: "emptyFollowers", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Não informado
      static let notInformed = Rswift.StringResource(key: "notInformed", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Não localizamos seu 🤖. Tente novamente!
      static let invalidUsername = Rswift.StringResource(key: "invalidUsername", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: OK
      static let ok = Rswift.StringResource(key: "ok", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Ocorreu um erro 🤕.Tente novamente!
      static let somenthingBadHappend = Rswift.StringResource(key: "somenthingBadHappend", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Oops, an error has occurred!
      static let errorTitle = Rswift.StringResource(key: "errorTitle", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Procure por username
      static let searchByUsername = Rswift.StringResource(key: "searchByUsername", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Sorry, an error occurred with the database.
      static let databaseError = Rswift.StringResource(key: "databaseError", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Sorry, something went wrong. Try again later.
      static let errorDescription = Rswift.StringResource(key: "errorDescription", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Sorry, there was an error connecting to the servers.
      static let networkError = Rswift.StringResource(key: "networkError", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)

      /// Value: Buscar seguidores
      static func searchFollowers(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("searchFollowers", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "searchFollowers"
        }

        return NSLocalizedString("searchFollowers", bundle: bundle, comment: "")
      }

      /// Value: Desculpe 😥 
      static func sorry(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("sorry", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "sorry"
        }

        return NSLocalizedString("sorry", bundle: bundle, comment: "")
      }

      /// Value: Desculpe! Encontramos um erro no decode.
      static func decodeError(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("decodeError", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "decodeError"
        }

        return NSLocalizedString("decodeError", bundle: bundle, comment: "")
      }

      /// Value: Digite o username
      static func enterUsername(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("enterUsername", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "enterUsername"
        }

        return NSLocalizedString("enterUsername", bundle: bundle, comment: "")
      }

      /// Value: Digite o username 🤖
      static func emptyUsername(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("emptyUsername", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "emptyUsername"
        }

        return NSLocalizedString("emptyUsername", bundle: bundle, comment: "")
      }

      /// Value: Hey!
      static func hello(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("hello", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "hello"
        }

        return NSLocalizedString("hello", bundle: bundle, comment: "")
      }

      /// Value: Não disponível
      static func notAvailable(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("notAvailable", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "notAvailable"
        }

        return NSLocalizedString("notAvailable", bundle: bundle, comment: "")
      }

      /// Value: Não encontramos seguidores 👣 . Que tal ser o primeiro ? 😁
      static func emptyFollowers(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("emptyFollowers", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "emptyFollowers"
        }

        return NSLocalizedString("emptyFollowers", bundle: bundle, comment: "")
      }

      /// Value: Não informado
      static func notInformed(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("notInformed", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "notInformed"
        }

        return NSLocalizedString("notInformed", bundle: bundle, comment: "")
      }

      /// Value: Não localizamos seu 🤖. Tente novamente!
      static func invalidUsername(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("invalidUsername", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "invalidUsername"
        }

        return NSLocalizedString("invalidUsername", bundle: bundle, comment: "")
      }

      /// Value: OK
      static func ok(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("ok", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "ok"
        }

        return NSLocalizedString("ok", bundle: bundle, comment: "")
      }

      /// Value: Ocorreu um erro 🤕.Tente novamente!
      static func somenthingBadHappend(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("somenthingBadHappend", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "somenthingBadHappend"
        }

        return NSLocalizedString("somenthingBadHappend", bundle: bundle, comment: "")
      }

      /// Value: Oops, an error has occurred!
      static func errorTitle(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("errorTitle", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "errorTitle"
        }

        return NSLocalizedString("errorTitle", bundle: bundle, comment: "")
      }

      /// Value: Procure por username
      static func searchByUsername(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("searchByUsername", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "searchByUsername"
        }

        return NSLocalizedString("searchByUsername", bundle: bundle, comment: "")
      }

      /// Value: Sorry, an error occurred with the database.
      static func databaseError(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("databaseError", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "databaseError"
        }

        return NSLocalizedString("databaseError", bundle: bundle, comment: "")
      }

      /// Value: Sorry, something went wrong. Try again later.
      static func errorDescription(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("errorDescription", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "errorDescription"
        }

        return NSLocalizedString("errorDescription", bundle: bundle, comment: "")
      }

      /// Value: Sorry, there was an error connecting to the servers.
      static func networkError(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("networkError", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "networkError"
        }

        return NSLocalizedString("networkError", bundle: bundle, comment: "")
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }

  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }

    fileprivate init() {}
  }

  fileprivate class Class {}

  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    #if os(iOS) || os(tvOS)
    try storyboard.validate()
    #endif
  }

  #if os(iOS) || os(tvOS)
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      #if os(iOS) || os(tvOS)
      try launchScreen.validate()
      #endif
    }

    #if os(iOS) || os(tvOS)
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController

      let bundle = R.hostingBundle
      let name = "LaunchScreen"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    fileprivate init() {}
  }
  #endif

  fileprivate init() {}
}
