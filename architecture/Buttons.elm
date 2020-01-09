module Main exposing (..)

-- Press buttons to increment and decrement a counter.
--
-- Read how it works:
--   https://guide.elm-lang.org/architecture/buttons.html
--
-- See how it works:
--	https://elm-lang.org/examples/buttons
--

import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)



-- MAIN
-- main is a special value, it describes what is shown on screen.
-- It needs an init value, a view function and an update function.


main =
  Browser.sandbox { init = init, update = update, view = view }



-- MODEL
-- init is the data we use to initialize the application.


-- Alias Model type as Int.
type alias Model = Int

-- Initialize the counter value.
init : Model
init =
  0



-- UPDATE
-- How the Model changes over time.

-- Alias Msg type as Increment, Decrement or Reset.
type Msg
  = Increment
  | Decrement
  | Reset

-- Handle messages.
-- When we get a message, we execute update and generate a new Model then we view this new Model.
-- function that takes a Msg gives a Model that gives a Model.
update : Msg -> Model -> Model
update msg model =
  case msg of
    Increment ->
      model + 1

    Decrement ->
      model - 1
	
	Reset ->
	  0


-- VIEW
-- What is displayed on screen.

-- function that takes a Model and gives a HTML and Msg type values.
view : Model -> Html Msg
view model =
  div []
    [ button [ onClick Decrement ] [ text "-" ]
    , div [] [ text (String.fromInt model) ]
    , button [ onClick Increment ] [ text "+" ]
    , button [ onClick Reset] [ text "Reset"]
    ]
-- onClick generates a message with value Decrement, Increment or Reset.

-- 1. User input.
-- 2. send message to update.
-- 3. Produce new Model.
-- 4. Call view and get a new HTML.
-- 5. Display the HTML on screen.
-- 6. Rinse and repeat.
