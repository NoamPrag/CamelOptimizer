open Common

module HairLength = QueryPart (struct
  type t = [ `Short | `Middle | `Long ]

  let param_name = "hair"

  let to_string = function
    | `Short -> "short"
    | `Middle -> "middle"
    | `Long -> "long"
end)

module BoobSize = QueryPart (struct
  type t = [ `A | `B | `C | `D ]

  let param_name = "boobs"
  let to_string = function `A -> "a" | `B -> "b" | `C -> "c" | `D -> "d"
end)

module Figure = QueryPart (struct
  type t = [ `Thin | `Sporty | `Normal | `Chubby | `Fat ]

  let param_name = "figure"

  let to_string = function
    | `Thin -> "thin"
    | `Sporty -> "sporty"
    | `Normal -> "normal"
    | `Chubby -> "chubby"
    | `Fat -> "fat"
end)

type girl = {
  age : Age.t;
  height : Height.t;
  haircolor : HairColor.t;
  hairlength : HairLength.t;
  eyecolor : EyeColor.t;
  boob_size : BoobSize.t;
  figure : Figure.t;
}

let girl_query g =
  Gender.get_query_part `Female
  ^ Age.get_query_part g.age
  ^ Height.get_query_part g.height
  ^ HairColor.get_query_part g.haircolor
  ^ HairLength.get_query_part g.hairlength
  ^ EyeColor.get_query_part g.eyecolor
  ^ BoobSize.get_query_part g.boob_size
  ^ Figure.get_query_part g.figure
