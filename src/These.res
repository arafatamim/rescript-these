type t<'a, 'b> = This('a) | That('b) | These('a, 'b)

let getExn = opt =>
  switch opt {
  | This(x) => x
  | That(_) => raise(Not_found)
  | These(x, _) => x
  }

let mapWithDefaultU = (opt, default, f) =>
  switch opt {
  | This(x) => f(. x)
  | That(_) => default
  | These(x, _) => f(. x)
  }

let mapWithDefault = (opt, default, f) => mapWithDefaultU(opt, default, (. x) => f(x))

let mapThisU = (opt, f) =>
  switch opt {
  | This(x) => This(f(. x))
  | That(y) => That(y)
  | These(x, y) => These(f(. x), y)
  }

let mapThis = (opt, f) => mapThisU(opt, (. x) => f(x))

let mapThatU = (opt, g) =>
  switch opt {
  | This(x) => This(x)
  | That(y) => That(g(. y))
  | These(x, y) => These(x, g(. y))
  }

let mapThat = (opt, g) => mapThatU(opt, (. y) => g(y))

let mapBothU = (opt, f, g) =>
  switch opt {
  | This(x) => This(f(. x))
  | That(y) => That(g(. y))
  | These(x, y) => These(f(. x), g(. y))
  }

let mapBoth = (opt, f, g) => mapBothU(opt, (. x) => f(x), (. y) => g(y))

let flatMapThisU = (opt, f) =>
  switch opt {
  | This(x) => f(. x)
  | That(y) => That(y)
  | These(x, _) => f(. x)
  }

let flatMapThis = (opt, f) => flatMapThisU(opt, (. x) => f(x))

let flatMapThatU = (opt, g) =>
  switch opt {
  | This(x) => This(x)
  | That(y) => g(. y)
  | These(_, y) => g(. y)
  }

let flatMapThat = (opt, g) => flatMapThatU(opt, (. y) => g(y))

let reduceThisU = (opt, initial, f) =>
  switch opt {
  | This(x) => f(. initial, x)
  | That(_) => initial
  | These(x, _) => f(. initial, x)
  }

let reduceThis = (opt, initial, f) => reduceThisU(opt, initial, (. initial, x) => f(initial, x))

let reduceThatU = (opt, initial, g) =>
  switch opt {
  | This(_) => initial
  | That(y) => g(. initial, y)
  | These(_, y) => g(. initial, y)
  }

let reduceThat = (opt, initial, g) => reduceThatU(opt, initial, (. initial, y) => g(initial, y))

let getThis = opt =>
  switch opt {
  | This(x) => Some(x)
  | That(_) => None
  | These(x, _) => Some(x)
  }

let getThat = opt =>
  switch opt {
  | This(_) => None
  | That(y) => Some(y)
  | These(_, y) => Some(y)
  }

let getWithDefault = (opt, default) =>
  switch opt {
  | This(x) => x
  | That(_) => default
  | These(x, _) => x
  }

let isThis = opt =>
  switch opt {
  | This(_) => true
  | _ => false
  }

let isThat = opt =>
  switch opt {
  | That(_) => true
  | _ => false
  }

let isBoth = opt =>
  switch opt {
  | These(_) => true
  | _ => false
  }

let fromOptions = (opt1, opt2) =>
  switch (opt1, opt2) {
  | (None, None) => None
  | (Some(a), None) => Some(This(a))
  | (None, Some(b)) => Some(That(b))
  | (Some(a), Some(b)) => Some(These(a, b))
  }
