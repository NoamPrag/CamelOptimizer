module Calculator = Calculator
open Calculator

let rec optimize (change_fn : person -> int -> person) (p : person)
    (min_value : int) (max_value : int) =
  let range = max_value - min_value in
  let quarter_range = float_of_int range /. 4. |> ceil |> int_of_float in
  let quarter_value = min_value + quarter_range in
  let three_quarter_value = max_value - quarter_range in
  if three_quarter_value = quarter_value then quarter_value
  else
    let quarter_res = calculate @@ change_fn p quarter_value in
    let three_quarter_res = calculate @@ change_fn p three_quarter_value in
    if quarter_res > three_quarter_res then
      optimize change_fn p min_value three_quarter_value
    else optimize change_fn p quarter_value max_value

let optimize_height = optimize with_height
let optimize_age = optimize with_age
