module Library.Util where

import Effects exposing (Effects)
import Debug exposing (watch)

broadcast : List (Signal.Address d) -> d -> a -> Effects a
broadcast outputs data action =
  let check = watch "outputs" outputs
  in
    (List.map ((flip Signal.send) data) outputs)
      |> (List.map Effects.task)
      |> Effects.batch
      |> Effects.map (always action)
