# CCValidator 💳💰💻

[![BuddyBuild](https://dashboard.buddybuild.com/api/statusImage?appID=58ac50fb4ad7d401004cd555&branch=master&build=latest)](https://dashboard.buddybuild.com/apps/58ac50fb4ad7d401004cd555/build/latest?branch=master)
[![Version](https://img.shields.io/cocoapods/v/CCValidator.svg?style=flat)](http://cocoapods.org/pods/CCValidator)
[![License](https://img.shields.io/cocoapods/l/CCValidator.svg?style=flat)](http://cocoapods.org/pods/CCValidator)
[![Platform](https://img.shields.io/cocoapods/p/CCValidator.svg?style=flat)](http://cocoapods.org/pods/CCValidator)

CCValidator (we're very proud of the unique name 😉) provides validation for credit card number input. 

* Validate card numbers using [Luhn algorithm](https://en.wikipedia.org/wiki/Luhn_algorithm),
* Detect credit card type before user provides full card number (this way, you can tell your user you don't support card XXX early, without frustrating him only after he typed all 16 digits).

Opposing to other existing validation libraries, this one doesn't use Regex. 
It was inspired by [CreditCardJS](https://creditcardjs.com/credit-card-type-detection) and its purpose it to provide a clear code, understanding which doesn't require knowledge of regex -- everyone should be able to read and edit validation code with ease.

Plus, ability to detect possible card type even from only first digit, lets you fail early. 

## Example

This pod doesn't contain an example app, but [tests](https://github.com/DigitalForms/CCValidator/blob/master/Tests/TestCCValidator.swift) should show you how to use it properly. 

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Usage

### Get type from prefix

To get type from card prefix, pass credit card input you have (can be as short as 1 character string). Validator will check it against all types it knows and return recognized type, or .`NotRecognized`.

**Obj-C:**

```objc
NSString *numberAsString = textField.text;
CreditCardType creditCardType = [CCValidator typeCheckingPrefixOnlyWithCreditCardNumber:cardNumber];
//check if type is e.g. CreditCardTypeVisa, CreditCardTypeMasterCard or CreditCardTypeNotRecognized
```
**Swift:**

```swift
let numberAsString = textField.text
let recognizedType = CCValidator.typeCheckingPrefixOnly(creditCardNumber: numberAsString)
//check if type is e.g. .Visa, .MasterCard or .NotRecognized
```

### Validate length, type and correctness

You can also validate length and type -- e.g. if validator recognizes card as MasterCard, it won't validate cards with different length than 16 digits. For Visa, it will allow 13, 16 and 19 digits etc.

Next to that, it also validates card number using Luhn algorithm -- this way you can pass to your payment processor only cards that numbers look like correct ones.

**Obj-C:**

```objc
NSString *numberAsString = textField.text;
BOOL isFullCardDataOK = [CCValidator validateWithCreditCardNumber:numberAsString];
```

**Swift:**

```swift
let numberAsString = textField.text
let isFullCardDataOK = CCValidator.validate(creditCardNumber: numberAsString)
```

## Requirements

This pod doesn't have any extra dependencies. 

## Installation

CCValidator is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "CCValidator"
```

## Author

Mariusz Wisniewski, [Digital Forms](http://www.digitalforms.pl)

## License

CCValidator is available under the MIT license. See the LICENSE file for more info.

## Version history

* **1.2.0** - 2020/04/03
    * Update for Swift 5 (thanks [@maetschl](https://github.com/maetschl)!) 
* **1.1.0** - 2019/09/27
    * Update for Swift 4.2 (thanks [@jessearmand](https://github.com/jessearmand)!) 
* **1.0.2** - 2017/03/24
* Fix for iPhone 4S (thanks [@jessearmand](https://github.com/jessearmand)!) 
* **1.0.1** - 2017/02/22
    * Updated documentation 
* **1.0.0** - 2017/02/21
    * Initial version of the library 
