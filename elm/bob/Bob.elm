module Bob exposing (hey)
import Char exposing (isUpper)
import Regex

isLetter : String -> Bool
isLetter str =
  Regex.contains (Regex.regex "[A-Za-z]") str

filterLetters : List Char -> List Char
filterLetters aListOfLetters =
  List.filter isLetter aListOfLetters

allUpperCase : List Char -> Bool
allUpperCase aListOfLetters =
  (List.all isUpper aListOfLetters) && (List.any isUpper aListOfLetters)

isAllCaps : String -> Bool
isAllCaps str =
  getLetters str |> filterLetters |> allUpperCase

isQuestion : String -> Bool
isQuestion str =
  String.endsWith "?" str

getLetters : String -> List Char
getLetters str =
  String.toList str

isEmpty : String -> Bool
isEmpty str =
  String.trim str == ""

isAllWhiteSpace : String -> Bool
isAllWhiteSpace str =
  List.all isEmpty (String.words str)

-- Debug.log (toString aListOfLetters)

hey : String -> String
hey remark =
  if (remark |> isEmpty) || (remark |> isAllWhiteSpace) then
    "Fine. Be that way!"
  else if (remark |> isQuestion) && (remark |> isAllCaps) then
    "Calm down, I know what I'm doing!"
  else if remark |> isQuestion then
    "Sure."
  else if remark |> isAllCaps then
    "Whoa, chill out!"
  else
    "Whatever."
