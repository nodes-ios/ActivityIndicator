# Spinner
> Present loading indicators anywhere quickly and easily

[![Travis](https://travis-ci.org/nodes-ios/Spinner.svg?branch=master)](https://travis-ci.org/nodes-ios/Spinner)
[![Codecov](https://img.shields.io/codecov/c/github/nodes-ios/Spinner.svg)](https://codecov.io/github/nodes-ios/Spinner)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
![Plaform](https://img.shields.io/badge/platform-iOS-lightgrey.svg)
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/nodes-ios/Spinner/blob/master/LICENSE)

A helpful loading spinner tool allowing you to present a UIActivityIndicator view directly in to views and buttons.

## 📝 Requirements

* iOS 9.0+
* Swift 4.0+  
*(Swift 2.2 & Swift 2.3 & Swift 3 supported in older versions)*

## 📦 Installation

### Carthage
~~~
github "nodes-ios/Spinner" ~> 2.0
~~~

> Last versions compatible with lower Swift versions:  
>
> **Swift 3**  
> `github "nodes-ios/Spinner" ~> 1.2`
>
> **Swift 2.3**  
> `github "nodes-ios/Spinner" == 0.2.5`
>
> **Swift 2.2**  
> `github "nodes-ios/Spinner" == 0.2.4`

## 💻 Usage

### Global Settings

SpinnerView has global properties that can be set for convinience to ensure that all spinners look the same. Call these at app launch if needed.

```swift
SpinnerView.spinnerColor = .red
SpinnerView.style = .white
SpinnerView.dimViewBackgroundColor = .black
```

### Standard spinner
Easily present spinners in views like so:

```swift
class ViewController: UIViewController {
  
     private let spinner = SpinnerView()
    
     override func viewDidLoad() {
        super.viewDidLoad()
       
        spinner.show(in: view)
    }
}
```

Spinner also gives you the option to customise the UIActivityIndicator Style, color and dimView backgroundColor for each individual spinner instance. These will override any Global settings.

```swift
let spinner = SpinnerView(style: .white, color: .red, dimViewBackgroundColor: .black)
```

Example of adding it to a view.

```swift
spinner.show(in: view, disablesUserInteraction: false, dimBackground: true)
```

To remove the spinner from your view simply call dismiss.

```swift
spinner.dismiss()
```

### Custom spinner
If you would rather use something more custom than the UIActivityIndicator, you can set an array of images to the Spinner with a duration time it takes to animate through them and display it in a view.

First setup SpinnerView with your array of images e.g. AppDelegate

```swift
let imagesArray = [...]
SpinnerView.set(withCustomImages: imagesArray, duration: 2)
```

and than simply call the custom show method

```swif
spinner.showCustom(in: view, disablesUserInteraction: false, dimBackground: true)
```

### Buttons
You can also display the spinner in buttons, simply add the spinner to any UIButton and the spinner will hide the title in the button and display the spinner in the centre of the button. Once the spinner is dismissed, the title will be made visible once more.

```swift
spinner.show(in: button, disablesUserInteraction: false)
spinner.showCustom(in: button, disablesUserInteraction: false)
```

## Credits
Made with ❤️ at [Nodes](http://nodesagency.com).

## 📄 License
**Spinner** is available under the MIT license. See the [LICENSE](https://github.com/nodes-ios/Spinner/blob/master/LICENSE) file for more info.
