module Card exposing (..)

import Json.Encode
import Json.Decode
import Json.Decode.Pipeline

type alias Card =
    { type_ : String
    , nameShort : String
    , name : String
    , value : String
    , valueInt : Int
    , meaningUp : String
    , meaningRev : String
    , desc : String
    }

decodeCard : Json.Decode.Decoder Card
decodeCard =
    Json.Decode.succeed Card
        |> Json.Decode.Pipeline.required "type" (Json.Decode.string)
        |> Json.Decode.Pipeline.required "nameShort" (Json.Decode.string)
        |> Json.Decode.Pipeline.required "name" (Json.Decode.string)
        |> Json.Decode.Pipeline.required "value" (Json.Decode.string)
        |> Json.Decode.Pipeline.required "valueInt" (Json.Decode.int)
        |> Json.Decode.Pipeline.required "meaningUp" (Json.Decode.string)
        |> Json.Decode.Pipeline.required "meaningRev" (Json.Decode.string)
        |> Json.Decode.Pipeline.required "desc" (Json.Decode.string)

encodeCard : Card -> Json.Encode.Value
encodeCard record =
    Json.Encode.object
        [ ("type",  Json.Encode.string <| record.type_)
        , ("nameShort",  Json.Encode.string <| record.nameShort)
        , ("name",  Json.Encode.string <| record.name)
        , ("value",  Json.Encode.string <| record.value)
        , ("valueInt",  Json.Encode.int <| record.valueInt)
        , ("meaningUp",  Json.Encode.string <| record.meaningUp)
        , ("meaningRev",  Json.Encode.string <| record.meaningRev)
        , ("desc",  Json.Encode.string <| record.desc)
        ]
