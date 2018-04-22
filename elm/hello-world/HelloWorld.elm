module HelloWorld exposing (helloWorld)

helloWorld : Maybe String -> String
helloWorld name =
    "Hello, " ++ Maybe.withDefault "World" name ++ "!"
