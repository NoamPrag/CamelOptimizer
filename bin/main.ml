let min_age = 14
let max_age = 70
let min_height = 140
let max_height = 220

open Camel_optimizer
open Calculator

let me : person =
  Boy
    {
      age = 19;
      height = 175;
      haircolor = `Brown;
      hairlength = `Short;
      eyecolor = `Green;
      beard = `None;
      body = `Normal;
    }

let () =
  let my_optimal_height = optimize_height me min_height max_height in
  let my_optimal_age =
    optimize_age (with_height me my_optimal_height) min_age max_age
  in
  print_endline @@ "a: "
  ^ string_of_int my_optimal_age
  ^ ", h: "
  ^ string_of_int my_optimal_height
