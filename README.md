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
| Mobile number | `MobileNumberValidator` | 10 digits starting with 6-9. An optional `+91`, `91` or `0` prefix is accepted, and spaces and hyphens are ignored |
| PIN code | `PINCodeValidator` | 6 digits, first digit not `0` |
| UPI ID | `UPIIDValidator` | `name@handle`. Checked leniently, because handles change over time |

Planned: Aadhaar, GSTIN, TAN, Voter ID, Passport and vehicle registration.

## Installation

Swift Package Manager: in Xcode, choose **File → Add Package Dependencies** and paste:

```
https://github.com/Majid1383/IndianIDValidatorKit
```

Or add it to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/Majid1383/IndianIDValidatorKit", from: "0.2.0")
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
IFSCValidator().validate("SBIN0001234").isValid             // true
MobileNumberValidator().validate("+91 98765 43210").isValid // true
PINCodeValidator().validate("400001").isValid               // true
UPIIDValidator().validate("name@oksbi").isValid             // true
```

Inputs are trimmed before validation. PAN and IFSC are also uppercased, and the mobile validator ignores spaces and hyphens.

### Failure reasons

| Case | Meaning |
|---|---|
| `.empty` | Nothing was entered |
| `.wrongLength(expected:actual:)` | Wrong number of characters (not used for UPI IDs, which vary in length) |
| `.invalidCharacters` | Contains characters outside the allowed set (non-ASCII, symbols and so on) |
| `.invalidFormat` | Right characters, but the structure or position rules fail |

## What this package does not do

It checks **format only**. A passing result means the ID is well-formed, not that it exists, is active, or belongs to a particular person. Verifying that needs the issuer's systems (for example NSDL, UIDAI or your bank).

## Contributing

Issues and pull requests are welcome. Please include tests with any new validator.

## License

MIT. See [LICENSE](LICENSE).
