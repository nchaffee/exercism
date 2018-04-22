module HelloWorld exposing (helloWorld)

mightBeANameHere : Maybe String -> String
mightBeANameHere str =
    case str of
    Nothing ->
      "World"

    Just val ->
      val


helloWorld : Maybe String -> String
helloWorld name =
    String.concat ["Hello, ", (mightBeANameHere name), "!"]
