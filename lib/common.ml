module type PersonParameter = sig
  type t

  val param_name : string
  val to_string : t -> string
end

module QueryPart (P : PersonParameter) = struct
  type t = P.t

  let get_query_part (value : P.t) : string =
    "&" ^ P.param_name ^ "=" ^ P.to_string value
end

module Age = QueryPart (struct
  type t = int

  let param_name = "age"
  let to_string = string_of_int
end)

module Height = QueryPart (struct
  type t = int

  let param_name = "height"
  let to_string = string_of_int
end)

module Gender = QueryPart (struct
  type t = [ `Male | `Female ]

  let param_name = "gender"
  let to_string = function `Male -> "male" | `Female -> "female"
end)

module HairColor = QueryPart (struct
  type t = [ `Blonde | `Brown | `Black | `Red | `Grey ]

  let param_name = "haircolor"

  let to_string = function
    | `Blonde -> "blonde"
    | `Brown -> "brown"
    | `Black -> "black"
    | `Red -> "red"
    | `Grey -> "grey"
end)

module EyeColor = QueryPart (struct
  type t = [ `Blue | `Green | `Brown | `Grey ]

  let param_name = "eyecolor"

  let to_string = function
    | `Blue -> "blue"
    | `Green -> "green"
    | `Brown -> "brown"
    | `Grey -> "grey"
end)
