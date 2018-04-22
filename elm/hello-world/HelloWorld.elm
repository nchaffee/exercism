module HelloWorld exposing (helloWorld)

helloWorld name =
  "Hello, "
  ++ (case name of
      Nothing ->
        "World"

      Just name ->
        name)
  ++ "!"
