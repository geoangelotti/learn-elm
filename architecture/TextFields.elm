-- A text input for reversing text. Very useful!
--
-- Read how it works:
--   https://guide.elm-lang.org/architecture/text_fields.html
-- 
-- See how it works:
--   https://elm-lang.org/examples/text-fields
--

import Browser
import Html exposing (Html, Attribute, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)



-- MAIN


main =
  Browser.sandbox { init = init, update = update, view = view }



-- MODEL

-- Alias Model as a record that has a field with type String.
-- Records help for scaling and maintainability.
type alias Model =
  { content : String
  }


init : Model
init =
  { content = "" }



-- UPDATE


type Msg
  = Change String


update : Msg -> Model -> Model
update msg model =
  case msg of
    Change newContent ->
	  -- Save to Model a copy of model with the field content changed.
      { model | content = newContent }



-- VIEW


view : Model -> Html Msg
view model =
  div []
    [ input [ placeholder "Text to reverse", value model.content, onInput Change ] []
    , div [] [ text ("Reversed: " ++ String.reverse model.content) ]
    , div[] [text ("Length: " ++ String.fromInt (String.length model.content))]
    ]