module Bob exposing (hey, isQuestion, allCaps)
import Regex exposing (contains, regex)

isUpperCase : String -> Bool
isUpperCase str =
  Regex.contains (Regex.regex "[A-Z]") str

isLetter : String -> Bool
isLetter str =
  Regex.contains (Regex.regex "[A-Za-z]") str

filterLetters : List String -> List String
filterLetters aListOfLetters =
  List.filter isLetter aListOfLetters

allUpperCase : List String -> Bool
allUpperCase aListOfLetters =
  (List.all isUpperCase aListOfLetters) && (List.any isUpperCase aListOfLetters)

allCaps : String -> Bool
allCaps str =
  getLetters str |> filterLetters |> allUpperCase

isQuestion : String -> Bool
isQuestion str =
  String.endsWith "?" str

getLetters : String -> List String
getLetters str =
  String.split("") str

isEmpty : String -> Bool
isEmpty str =
  getLetters str
  |> List.isEmpty

isAllWhiteSpace : String -> Bool
isAllWhiteSpace str =
  List.all isEmpty (String.words str)

-- Debug.log (toString aListOfLetters)

hey : String -> String
hey remark =
  if (isEmpty remark) || (isAllWhiteSpace remark) then
    "Fine. Be that way!"
  else if isQuestion remark && allCaps remark then
    "Calm down, I know what I'm doing!"
  else if isQuestion remark then
    "Sure."
  else if allCaps remark then
    "Whoa, chill out!"
  else
    "Whatever."
