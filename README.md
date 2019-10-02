# Xcode Code Snippets

Some useful Code Snippets for your Xcode. It generates you templates for the following cases:

  - [CollectionView Delegate and DataSource](#collectionview-delegate-and-datasource)
  - [CollectionView configuration](#collectionview-configuration)
  - [Constants](#constants)
  - [Dequeue TableView Cell](#dequeue-tableview-cell)
  - [Disable SwiftLint rule](#disable-swiftlint-rule)
  - [Load data from plist file](#load-data-from-plist-file)
  - [TableView configuration](#tableview-configuration)
  - [TableView Delegate and DataSource](#tableview-delegate-and-datasource)

<br/>

## Installation

Run the following command of the make-file in Terminal:

```sh
$ make install_snippets
```

Please restart Xcode after installation.

## Uninstallation

Run the following command of the make-file in Terminal:

```sh
$ make uninstall_snippets
```

Please restart Xcode after uninstallation.

<br/>

## Overview

### CollectionView Delegate and DataSource

| Configuration ||
| --- | --- |
| Title | CollectionView Delegate and DataSource |
| Summary | Creates the extensions for collectionView Delegate and DataSource with a default implementation of the most used methods. |
| Platform | All |
| Language | Swift |
| Completion Shortcut | collectionDelDat |
| Completion Scopes | TopLevel |

#### Code

```swift
extension <#ViewController#>: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
}

extension <#ViewController#>: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return <#numberOfItemsInSection#>
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case <#section#>:
            return contentCollectionViewCell(for: indexPath)
        default:
            return UICollectionViewCell()
        }
    }

    private func contentCollectionViewCell(for indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: <#cellIdentifier#>, for: indexPath) as? <#UICollectionViewCell#> {
            cell.<#property#> = <#value#>
            return cell
        }
        return UICollectionViewCell()
    }

    private func noContentCollectionViewCell(for indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: <#cellIdentifier#>, for: indexPath) as? <#UICollectionViewCell#> {
            cell.<#property#> = <#value#>
            return cell
        }
        return UICollectionViewCell()
    }
}
```

</br>

### CollectionView configuration

| Configuration ||
| --- | --- |
| Title | CollectionView Configuration |
| Summary | Creates a private method with a default configuration for a collectionView. |
| Platform | All |
| Language | Swift |
| Completion Shortcut | configCollection |
| Completion Scopes | ClassImplementation |

#### Code

```swift
private func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self

        let nib = UINib(nibName: <#nibName#>, bundle: nil)
        let noContentNib = UINib(nibName: <#noContentNibName#>, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: <#reuseIdentifier#>)
        collectionView.register(noContentNib, forCellWithReuseIdentifier: <#noContentReuseIdentifier#>)

        collectionView.isScrollEnabled = <#Bool#>
    }
```

<br/>

### Constants

| Configuration ||
| --- | --- |
| Title | Constants |
| Summary | Creates the constants enum which should contain all constants of a class. |
| Platform | All |
| Language | Swift |
| Completion Shortcut | consts |
| Completion Scopes | ClassImplementation |

#### Code

```swift
enum Constants {
    static let <#constantName#>: <#T#> = <#value#>
}
```

<br/>

### Dequeue TableView Cell

| Configuration ||
| --- | --- |
| Title | Dequeue TableView Cell |
| Summary | Creates a default body for dequeueing a tableView cell. |
| Platform | All |
| Language | Swift |
| Completion Shortcut | dequeueCell |
| Completion Scopes | CodeExpression|
||TopLevel|

#### Code

```swift
if let cell = tableView.dequeueReusableCell(withIdentifier: <#cellIdentifier#>, for: indexPath) as? <#UITableViewCell#> {
    cell.<#property#> = <#value#>
    return cell
}
return UITableViewCell()
```

<br/>

### Disable SwiftLint rule

| Configuration ||
| --- | --- |
| Title | Disable next SwiftLint rule |
| Summary | Disables the next specific SwiftLint rule. |
| Platform | All |
| Language | Swift |
| Completion Shortcut | lint |
| Completion Scopes | StringOrComment |

#### Code

```swift
// swiftlint:disable:next <#rule#>
```

<br/>

### Load data from plist file

| Configuration ||
| --- | --- |
| Title | Load data from plist |
| Summary | Decodes a plist file. |
| Platform | All |
| Language | Swift |
| Completion Shortcut | plist |
| Completion Scopes | ClassImplementation |

#### Code

```swift
func readDataFromPlist() -> <#T: Decodable.Protocol#>? {
    if let url = Bundle.main.url(forResource: "Info", withExtension: "plist"), let data = try? Data(contentsOf: url) {
        do {
            return try PropertyListDecoder().decode(<#T: Decodable.Protocol#>.self, from: data)
        } catch {
            print(error)
            return nil
        }
    } else {
        return nil
    }
}
```

<br/>

### TableView configuration

| Configuration ||
| --- | --- |
| Title | TableView Configuration |
| Summary | Creates a private method with a default configuration for a tableView with pull to refresh. |
| Platform | All |
| Language | Swift |
| Completion Shortcut | configTable |
| Completion Scopes | ClassImplementation |

#### Code

```swift
private let refreshControl = UIRefreshControl()

private func configureTableView() {
    tableView.delegate = self
    tableView.dataSource = self

    let nib = UINib(nibName: <#nibName#>, bundle: nil)
    let noContentNib = UINib(nibName: <#noContentNibName#>, bundle: nil)
    tableView.register(nib, forCellReuseIdentifier: <#reuseIdentifier#>)
    tableView.register(noContentNib, forCellReuseIdentifier: <#noContentReuseIdentifier#>)

    tableView.estimatedRowHeight = <#estimatedRowHeight#>
    tableView.rowHeight = UITableView.automaticDimension

    if #available(iOS 10.0, *) {
        tableView.refreshControl = refreshControl
    } else {
        tableView.addSubview(refreshControl)
    }
    refreshControl.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
}

@objc
private func refresh(_ sender: Any) {

}
```

<br/>

### TableView Delegate and DataSource

| Configuration ||
| --- | --- |
| Title | TableView Delegate and DataSource |
| Summary | Creates the extensions for tableView Delegate and DataSource with a default implementation of the most used methods. |
| Platform | All |
| Language | Swift |
| Completion Shortcut | tableDelDat |
| Completion Scopes | TopLevel |

#### Code

```swift
extension <#ViewController#>: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}

extension <#ViewController#>: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return <#numberOfRowsInSection#>
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case <#section#>:
            return contentTableViewCell(for: indexPath)
        default:
            return UITableViewCell()
        }
    }

    private func contentTableViewCell(for indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: <#cellIdentifier#>, for: indexPath) as? <#UITableViewCell#> {
            cell.<#property#> = <#value#>
            return cell
        }
        return UITableViewCell()
    }

    private func noContentTableViewCell() -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: <#cellIdentifier#>) as? <#UITableViewCell#> {
            cell.<#property#> = <#value#>
            return cell
        }
        return UITableViewCell()
    }
}
```

<br/>

## License

Xcode Code Snippets is released under the MIT License. See [LICENSE](LICENSE.md) for details.

## Contribution

Author: [ManDon5](https://github.com/ManDon5)
