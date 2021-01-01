StringOrInt : Bool -> Type
StringOrInt x = case x of
  True => Int
  False => String

getStringOrInt : (x : Bool) -> StringOrInt x
getStringOrInt x = case x of
  True => 94
  False => "NinetyFour"

valToString : (x : Bool) -> StringOrInt x -> String
valToString True val = cast val
valToString False val = val
