# FLEX Size Reduction Refactoring Log

This document tracks changes made to reduce the FLEX library size.

## Summary

| Date | Change | Lines Removed | Estimated Size Reduction |
|------|--------|---------------|-------------------------|
| 2026-01-13 | Remove Keychain viewer | ~960 | ~52K |
| 2026-01-13 | Remove DatabaseBrowser | ~1,900 | ~124K |
| 2026-01-13 | Remove RuntimeBrowser | ~3,000 | ~164K |
| 2026-01-13 | Remove SystemLog viewer | ~1,200 | ~88K |
| 2026-01-13 | Replace embedded PNGs with SF Symbols | ~8,600 | ~820K |
| **Total** | | **~16,700 lines** | **~1.25MB** |

---

## Detailed Changes

### 1. Keychain Viewer Removal

**Removed files:**
- `Classes/GlobalStateExplorers/Keychain/FLEXKeychain.h`
- `Classes/GlobalStateExplorers/Keychain/FLEXKeychain.m`
- `Classes/GlobalStateExplorers/Keychain/FLEXKeychainQuery.h`
- `Classes/GlobalStateExplorers/Keychain/FLEXKeychainQuery.m`
- `Classes/GlobalStateExplorers/Keychain/FLEXKeychainViewController.h`
- `Classes/GlobalStateExplorers/Keychain/FLEXKeychainViewController.m`
- `Classes/GlobalStateExplorers/Keychain/SSKeychain_LICENSE`

**Purpose:** Allowed viewing and inspecting iOS Keychain entries.

**Impact:** Low - rarely used feature, Keychain can be inspected via other tools.

---

### 2. DatabaseBrowser Removal

**Removed files:**
- `Classes/GlobalStateExplorers/DatabaseBrowser/FLEXDBQueryRowCell.h/.m`
- `Classes/GlobalStateExplorers/DatabaseBrowser/FLEXDatabaseManager.h`
- `Classes/GlobalStateExplorers/DatabaseBrowser/FLEXMultiColumnTableView.h/.m`
- `Classes/GlobalStateExplorers/DatabaseBrowser/FLEXRealmDatabaseManager.h/.m`
- `Classes/GlobalStateExplorers/DatabaseBrowser/FLEXRealmDefines.h`
- `Classes/GlobalStateExplorers/DatabaseBrowser/FLEXSQLResult.h/.m`
- `Classes/GlobalStateExplorers/DatabaseBrowser/FLEXSQLiteDatabaseManager.h/.m`
- `Classes/GlobalStateExplorers/DatabaseBrowser/FLEXTableColumnHeader.h/.m`
- `Classes/GlobalStateExplorers/DatabaseBrowser/FLEXTableContentViewController.h/.m`
- `Classes/GlobalStateExplorers/DatabaseBrowser/FLEXTableLeftCell.h/.m`
- `Classes/GlobalStateExplorers/DatabaseBrowser/FLEXTableListViewController.h/.m`
- `Classes/GlobalStateExplorers/DatabaseBrowser/FLEXTableRowDataViewController.h/.m`
- `Classes/GlobalStateExplorers/DatabaseBrowser/LICENSE`

**Purpose:** SQLite and Realm database browser with table viewing and querying.

**Impact:** Medium - useful for database-heavy apps, but many apps don't use local databases.

**Related changes:**
- Removed database file handling from `FLEXFileBrowserController.m`
- Removed "Browse Bundle as Database" shortcut from `FLEXBundleShortcuts.m`

---

### 3. RuntimeBrowser Removal

**Removed files:**
- `Classes/GlobalStateExplorers/RuntimeBrowser/DataSources/FLEXRuntimeClient.h/.m`
- `Classes/GlobalStateExplorers/RuntimeBrowser/DataSources/FLEXRuntimeController.h/.m`
- `Classes/GlobalStateExplorers/RuntimeBrowser/DataSources/FLEXRuntimeExporter.h/.m`
- `Classes/GlobalStateExplorers/RuntimeBrowser/FLEXKBToolbarButton.h/.m`
- `Classes/GlobalStateExplorers/RuntimeBrowser/FLEXKeyPathSearchController.h/.m`
- `Classes/GlobalStateExplorers/RuntimeBrowser/FLEXKeyboardToolbar.h/.m`
- `Classes/GlobalStateExplorers/RuntimeBrowser/FLEXObjcRuntimeViewController.h/.m`
- `Classes/GlobalStateExplorers/RuntimeBrowser/FLEXRuntimeBrowserToolbar.h/.m`
- `Classes/GlobalStateExplorers/RuntimeBrowser/FLEXRuntimeKeyPath.h/.m`
- `Classes/GlobalStateExplorers/RuntimeBrowser/FLEXRuntimeKeyPathTokenizer.h/.m`
- `Classes/GlobalStateExplorers/RuntimeBrowser/FLEXSearchToken.h/.m`

**Purpose:** Browse all Objective-C classes, methods, and properties in the runtime.

**Impact:** Medium - developer-focused feature for runtime exploration. Core object exploration still works.

---

### 4. SystemLog Viewer Removal

**Removed files:**
- `Classes/GlobalStateExplorers/SystemLog/ActivityStreamAPI.h`
- `Classes/GlobalStateExplorers/SystemLog/FLEXASLLogController.h/.m`
- `Classes/GlobalStateExplorers/SystemLog/FLEXLogController.h`
- `Classes/GlobalStateExplorers/SystemLog/FLEXOSLogController.h/.m`
- `Classes/GlobalStateExplorers/SystemLog/FLEXSystemLogCell.h/.m`
- `Classes/GlobalStateExplorers/SystemLog/FLEXSystemLogMessage.h/.m`
- `Classes/GlobalStateExplorers/SystemLog/FLEXSystemLogViewController.h/.m`
- `Classes/GlobalStateExplorers/SystemLog/LLVM_LICENSE.TXT`

**Purpose:** View NSLog and os_log system messages in-app.

**Impact:** Low - Xcode console provides the same functionality during development.

---

### 5. FLEXResources.m SF Symbols Migration

**Before:** 8,861 lines, 828K (69 embedded PNG icons as hex byte arrays)

**After:** 266 lines, 8K (SF Symbols + programmatic drawing)

**Changes made:**
- Replaced all 69 embedded PNG icons with SF Symbols equivalents
- Toolbar icons now use SF Symbols: `xmark`, `list.bullet`, `square.stack.3d.up`, `clock`, `arrow.up.and.down.and.arrow.left.and.right`, `hand.tap`, `bookmark`, `square.on.square`, `ellipsis.circle`, `gearshape`, `arrow.down.circle`
- Content type icons now use SF Symbols: `curlybraces`, `doc.text`, `doc.richtext`, `waveform`, `doc.badge.gearshape`, `list.bullet.rectangle`, `play.rectangle`, `chevron.left.forwardslash.chevron.right`, `doc.fill`
- 3D explorer icons use SF Symbols: `square`, `cube`
- Custom UI elements (drag handle, range slider components, patterns) generated programmatically

**Icon mappings:**
| Original | SF Symbol |
|----------|-----------|
| closeIcon | xmark |
| globalsIcon | list.bullet |
| hierarchyIcon | square.stack.3d.up |
| recentIcon | clock |
| moveIcon | arrow.up.and.down.and.arrow.left.and.right |
| selectIcon | hand.tap |
| bookmarksIcon | bookmark |
| openTabsIcon | square.on.square |
| moreIcon | ellipsis.circle |
| gearIcon | gearshape |
| scrollToBottomIcon | arrow.down.circle |
| jsonIcon | curlybraces |
| textPlainIcon | doc.text |
| htmlIcon | doc.richtext |
| audioIcon | waveform |
| jsIcon | doc.badge.gearshape |
| plistIcon | list.bullet.rectangle |
| textIcon | doc.text |
| videoIcon | play.rectangle |
| xmlIcon | chevron.left.forwardslash.chevron.right |
| binaryIcon | doc.fill |
| toggle2DIcon | square |
| toggle3DIcon | cube |

**Requirements:** iOS 16+ (minimum deployment target)

**Impact:** Low - Visual appearance may differ slightly but functionality identical

---

### 6. iOS 16+ Minimum Deployment Target

**Changes made:**
- Updated minimum deployment target from iOS 9 to iOS 16
- Removed all `@available(iOS X, *)` version checks for iOS versions < 16
- Removed all `API_AVAILABLE(ios(X))` annotations for iOS versions < 16
- Simplified code paths that were conditional on older iOS versions
- Updated Package.swift, FLEX.podspec, and project.pbxproj
- Removed `-Wno-unsupported-availability-guard` compiler flag (no longer needed)

**APIs now used unconditionally:**
- `UIWindowScene` (iOS 13+)
- `NSURLSessionWebSocketTask` (iOS 13+)
- `UIMenu` and context menus (iOS 13+)
- `UISelectionFeedbackGenerator` (iOS 10+)
- `UNUserNotificationCenter` (iOS 10+)
- `NSKeyedUnarchiver` secure coding APIs (iOS 12+)
- `WKWebViewConfiguration.dataDetectorTypes` (iOS 10+)
- `NSDirectionalEdgeInsets` (iOS 11+)
- `UIScrollView.adjustedContentInset` (iOS 11+)

**Impact:** None - all removed checks were for iOS versions below 16

---

## Updated Files

### `Classes/GlobalStateExplorers/Globals/FLEXGlobalsEntry.h`
- Removed enum values: `FLEXGlobalsRowSystemLog`, `FLEXGlobalsRowBrowseRuntime`, `FLEXGlobalsRowAppKeychainItems`

### `Classes/GlobalStateExplorers/Globals/FLEXGlobalsViewController.m`
- Removed imports for removed view controllers
- Removed menu entries for removed features

### `Classes/GlobalStateExplorers/FileBrowser/FLEXFileBrowserController.m`
- Removed `FLEXTableListViewController` import
- Removed database file handling code

### `Classes/ObjectExplorers/Sections/Shortcuts/FLEXBundleShortcuts.m`
- Removed "Browse Bundle as Database" feature
- Removed `FLEXRuntimeExporter` import

### `Classes/ObjectExplorers/FLEXObjectExplorerFactory.m`
- Removed switch cases for removed globals rows

### `FLEX.xcodeproj/project.pbxproj`
- Removed all file references for deleted files
- Removed group definitions for deleted directories

### `Package.swift`
- Removed excluded license files for removed features
- Removed header search paths for removed directories

---

## Features Still Available

After these removals, FLEX still provides:
- View hierarchy exploration and modification
- Object property/ivar inspection and editing
- Network request monitoring
- File browser (sandbox exploration)
- Live objects on heap
- Address explorer
- Cookies viewer
- Push notifications viewer
- App shortcuts (UserDefaults, Bundle, etc.)
- All core object exploration features

---

## Potential Future Removals

| Component | Estimated Size | Risk |
|-----------|---------------|------|
| ~~FLEXResources.m (embedded icons)~~ | ~~828K~~ | ✅ Completed - SF Symbols migration |
| Network/PonyDebugger | ~100K | Medium - affects network monitoring |
| ObjectShortcuts (28 files) | ~152K | Medium - reduces convenience features |
| FileBrowser | ~44K | Low - already optional |

---

## Notes

- All changes maintain backward compatibility for remaining features
- No public API changes for retained functionality
- Build tested after each removal phase
- Minimum deployment target updated to iOS 16+
- Removed all iOS version checks and API_AVAILABLE annotations for older versions

## Size Comparison

**Before refactoring:**
- Multiple modules with significant code
- FLEXResources.m: 828K of embedded PNG data

**After refactoring:**
- Removed ~16,700 lines of code
- Reduced size by ~1.25MB
- FLEXResources.m: 8K (99% reduction)
