# IndianIDValidatorKit

Offline format validation for Indian IDs, written in Swift.

- Pure Swift, no dependencies
- Works on iOS 16+ and macOS 13+
- Swift 6 ready: all types are `Sendable`
- Never makes network calls and never stores your input

## Supported validators

| ID | Validator | Rule checked |
|---|---|---|
| PAN | `PANValidator` | 5 letters, 4 digits, 1 letter |
| IFSC | `IFSCValidator` | 4 letters, `0`, 6 letters or digits |

More are planned, such as mobile number, PIN code and UPI ID.

## Installation

Swift Package Manager: in Xcode, choose **File → Add Package Dependencies** and paste:

```
https://github.com/Majid1383/IndianIDValidatorKit
```

Or add it to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/Majid1383/IndianIDValidatorKit", from: "0.1.0")
],
targets: [
    .target(name: "YourApp", dependencies: ["IndianIDValidatorKit"])
]
```

## Usage

```swift
import IndianIDValidatorKit

let result = PANValidator().validate("ABCDE1234F")

switch result {
case .valid:
    print("Looks good")
case .invalid(let reason):
    print("Invalid: \(reason)")
}

// Or just check a Bool:
IFSCValidator().validate("SBIN0001234").isValid
```

Inputs are trimmed and uppercased before validation.

### Failure reasons

| Case | Meaning |
|---|---|
| `.empty` | Nothing was entered |
| `.wrongLength(expected:actual:)` | Wrong number of characters |
| `.invalidCharacters` | Contains characters that are not ASCII letters or digits |
| `.invalidFormat` | Right length, but letters and digits are in the wrong positions |

## What this package does not do

It checks **format only**. A passing result means the ID is well-formed, not that it exists, is active, or belongs to a particular person. Verifying that needs the issuer's systems (for example NSDL, UIDAI or your bank).

## Contributing

Issues and pull requests are welcome. Please include tests with any new validator.

## License

MIT. See [LICENSE](LICENSE).
