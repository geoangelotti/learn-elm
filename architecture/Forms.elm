-- Input a user name and password. Make sure the password matches.
--
-- Read how it works:
--   https://guide.elm-lang.org/architecture/forms.html
--
-- See how it works:
--   https://elm-lang.org/examples/forms
--

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)



-- MAIN


main =
  Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
  { name : String
  , password : String
  , passwordAgain : String
  }


init : Model
init =
  Model "" "" ""



-- UPDATE


type Msg
  = Name String
  | Password String
  | PasswordAgain String


update : Msg -> Model -> Model
update msg model =
  case msg of
    Name name ->
      { model | name = name }

    Password password ->
      { model | password = password }

    PasswordAgain password ->
      { model | passwordAgain = password }



-- VIEW


view : Model -> Html Msg
view model =
  div []
    [ viewInput "text" "Name" model.name Name
    , viewInput "password" "Password" model.password Password
    , viewInput "password" "Re-enter Password" model.passwordAgain PasswordAgain
    , viewValidation (model.password == model.passwordAgain) "Passwords do not match!"
    , viewValidation (String.length model.password >= 8) "Password is small!"
    , viewValidation (String.any Char.isDigit model.password) "Password does not have at least a number!"
    , viewValidation (String.any Char.isUpper model.password) "Password does not have at least an upper case character!"
    , viewValidation (String.any Char.isLower model.password) "Password does not have at least an lower case character!"
    ]


viewInput : String -> String -> String -> (String -> msg) -> Html msg
viewInput t p v toMsg =
  input [ type_ t, placeholder p, value v, onInput toMsg ] []

viewValidation : Bool -> String -> Html msg
viewValidation boolean error =
	if boolean then
      div [ style "color" "green" ] [ text "OK" ]
    else
      div [ style "color" "red" ] [ text error ]
