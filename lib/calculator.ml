open Cohttp
open Cohttp_lwt_unix
open Lwt
open Soup
module Boy = Boy
module Girl = Girl

let camel_calculator_uri = Uri.of_string "https://kamelrechner.eu/en/result"

let headers =
  Header.add (Header.init ()) "content-type" "application/x-www-form-urlencoded"

let req body =
  Client.post camel_calculator_uri ~body ~headers >>= fun (_, body) ->
  Cohttp_lwt.Body.to_string body

type person = Boy of Boy.boy | Girl of Girl.girl

let with_age p age =
  match p with Boy b -> Boy { b with age } | Girl g -> Girl { g with age }

let with_height p height =
  match p with
  | Boy b -> Boy { b with height }
  | Girl g -> Girl { g with height }

let query = function Boy b -> Boy.boy_query b | Girl g -> Girl.girl_query g
let cache_initial_size = 256
let cache : (person, int) Hashtbl.t = Hashtbl.create cache_initial_size

let calculate person =
  match Hashtbl.find_opt cache person with
  | Some value -> value
  | None ->
      let result =
        `String (query person)
        |> req |> Lwt_main.run |> parse $ ".result" |> R.leaf_text
        |> int_of_string
      in
      Hashtbl.add cache person result;
      result
