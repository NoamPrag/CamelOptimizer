open Common

module HairLength = QueryPart (struct
  type t = [ `Bald | `Short | `Middle | `Long ]

  let param_name = "hair"

  let to_string = function
    | `Bald -> "bald"
    | `Short -> "short"
    | `Middle -> "middle"
    | `Long -> "long"
end)

module Beard = QueryPart (struct
  type t = [ `None | `Small | `Middle | `Large ]

  let param_name = "beard"

  let to_string = function
    | `None -> "none"
    | `Small -> "small"
    | `Middle -> "middle"
    | `Large -> "large"
end)

module Body = QueryPart (struct
  type t = [ `Muscle | `Normal | `Chubby ]

  let param_name = "body"

  let to_string = function
    | `Muscle -> "muscle"
    | `Normal -> "normal"
    | `Chubby -> "chubby"
end)

type boy = {
  age : Age.t;
  height : Height.t;
  haircolor : HairColor.t;
  hairlength : HairLength.t;
  eyecolor : EyeColor.t;
  beard : Beard.t;
  body : Body.t;
}

let boy_query b =
  Gender.get_query_part `Male
  ^ Age.get_query_part b.age
  ^ Height.get_query_part b.height
  ^ HairColor.get_query_part b.haircolor
  ^ HairLength.get_query_part b.hairlength
  ^ EyeColor.get_query_part b.eyecolor
  ^ Beard.get_query_part b.beard
  ^ Body.get_query_part b.body
