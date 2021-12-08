# rescript-these

An "either-or-both" monadic type implementation in ReScript. This can be thought of as an "inclusive-or" type (as opposed to `Result`'s "exclusive-or"), which can be used to represent the result of a computation that can fail, succeed, or do both at the same time.

The data type is defined as:
```rescript
type These.t<'a, 'b> = This('a) | That('b) | These('a, 'b)
```
This package provides various useful helper functions for transforming and querying the contained values.

## Installation
```sh
npm install rescript-these
```
Next, update the `bs-dependencies` key in your `bsconfig.json` to include `rescript-these`.

## Usage
```rescript
open These

let result = This("Hello")

// pattern matching
switch result {
  | This(data) => Js.log(data)
  | That(error) => Js.log(error)
  | These(data, error) => Js.log2(data, error)
}

// transform the contained value
let mapped = result->These.mapThis(data => data ++ " World!") // This("Hello World!")

// chain the result of one computation with that of the next one
let chain = result->These.flatMapThis(this => These(this, "Got error!")) // These("Hello World!", "Some Error!")
```

## Documentation
API documentation is available at [DOCUMENTATION.md](https://github.com/arafatamim/rescript-these/blob/main/DOCUMENTATION.md).

## License
MIT Licensed. See [LICENSE](https://github.com/arafatamim/rescript-these/blob/main/LICENSE) file.

## External links
1. [fp-ts - These](https://gcanti.github.io/fp-ts/modules/These.ts.html)
2. [joneshf/elm-these](https://github.com/joneshf/elm-these)
3. [purescript-contrib/purescript-these](https://github.com/purescript-contrib/purescript-these)