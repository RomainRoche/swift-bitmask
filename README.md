# ``bitmask``

This framework is an alternative to the native ``OptionSet`` structure. It is intended to make `bitmask` operations using `Enum`. 

## Example

```swift

import Bitmask


enum Subscription: Int, Maskable {
    case none       = 0b0
    case comedy     = 0b1
    case action     = 0b10
    case romance    = 0b100
}

// create a Bitmask<Subscription>
var subscriptions = Bitmask<Subscription>(with: .none)

// subscribe to `.comedy` and `.action`
subscription = subscription | .comedy
subscription = subscription | .action

// is subscribed to `.action`? -> true
let romanceSubscribed = subscription &? .action

// is subscribed to `.romance`? -> false
let romanceSubscribed = subscription &? .romance

// unsubscribe to `.comedy`
subscription = subscription &~ .comedy

```

## Installation

### Swift Package Manager

Add this repository as a **Swift Package**.

``https://github.com/RomainRoche/swift-bitmask``

