type t<'a, 'b> = This('a) | That('b) | These('a, 'b)

let getExn: t<'a, 'b> => 'a

let mapWithDefaultU: (t<'a, 'b>, 'c, (. 'a) => 'c) => 'c

let mapWithDefault: (t<'a, 'b>, 'c, 'a => 'c) => 'c

let mapThisU: (t<'a, 'b>, (. 'a) => 'c) => t<'c, 'b>

let mapThis: (t<'a, 'b>, 'a => 'c) => t<'c, 'b>

let mapThatU: (t<'a, 'b>, (. 'b) => 'c) => t<'a, 'c>

let mapThat: (t<'a, 'b>, 'b => 'c) => t<'a, 'c>

let mapBothU: (t<'a, 'b>, (. 'a) => 'c, (. 'b) => 'd) => t<'c, 'd>

let mapBoth: (t<'a, 'b>, 'a => 'c, 'b => 'd) => t<'c, 'd>

let flatMapThisU: (t<'a, 'b>, (. 'a) => t<'c, 'b>) => t<'c, 'b>

let flatMapThis: (t<'a, 'b>, 'a => t<'c, 'b>) => t<'c, 'b>

let flatMapThatU: (t<'a, 'b>, (. 'b) => t<'a, 'c>) => t<'a, 'c>

let flatMapThat: (t<'a, 'b>, 'b => t<'a, 'c>) => t<'a, 'c>

let reduceThisU: (t<'a, 'b>, 'c, (. 'c, 'a) => 'c) => 'c

let reduceThis: (t<'a, 'b>, 'c, ('c, 'a) => 'c) => 'c

let reduceThatU: (t<'a, 'b>, 'c, (. 'c, 'b) => 'c) => 'c

let reduceThat: (t<'a, 'b>, 'c, ('c, 'b) => 'c) => 'c

let getThis: t<'a, 'b> => option<'a>

let getThat: t<'a, 'b> => option<'b>

let getWithDefault: (t<'a, 'b>, 'a) => 'a

let isThis: t<'a, 'b> => bool

let isThat: t<'a, 'b> => bool

let isBoth: t<'a, 'b> => bool
