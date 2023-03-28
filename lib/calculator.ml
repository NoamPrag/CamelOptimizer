open Cohttp
open Cohttp_lwt_unix
open Lwt
open Soup

let camel_calculator_uri = Uri.of_string "https://kamelrechner.eu/en/result"

let headers =
  Header.add (Header.init ()) "content-type" "application/x-www-form-urlencoded"

let req body =
  Client.post camel_calculator_uri ~body ~headers >>= fun (_, body) ->
  Cohttp_lwt.Body.to_string body

type person = Boy of Boy.boy | Girl of Girl.girl

let query = function Boy b -> Boy.boy_query b | Girl g -> Girl.girl_query g

let calculate person =
  `String (query person)
  |> req |> Lwt_main.run |> parse $ ".result" |> R.leaf_text |> int_of_string
