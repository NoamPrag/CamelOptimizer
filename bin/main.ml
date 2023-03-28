let min_age = 14
let max_age = 70
let min_height = 140
let max_height = 220

let () =
  for age = min_age to max_age do
    for height = min_height to max_height do
      let b : Camel_optimizer.Calculator.person =
        Girl
          {
            age;
            height;
            haircolor = `Blonde;
            hairlength = `Long;
            eyecolor = `Blue;
            boob_size = `C;
            figure = `Chubby;
          }
      in
      let result = Camel_optimizer.Calculator.calculate b in
      print_newline ();
      print_string @@ "age: " ^ string_of_int age ^ ", height: "
      ^ string_of_int height ^ ": " ^ string_of_int result
    done
  done
