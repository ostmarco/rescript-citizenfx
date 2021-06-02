external identity: 'a => 'b = "%identity"

type rec t = [
  | #Null
  | #Int(int)
  | #Float(float)
  | #String(string)
  | #Variant(option<t>)
]

let unwrap = inputArgument =>
  switch inputArgument {
  | #Null => identity(None)

  | #Int(value) => identity(value)

  | #Float(value) => identity(value)

  | #String(value) => identity(value)

  | #Variant(value) =>
    switch value {
    | None => identity(None)

    | Some(value) => identity(value)
    }
  }
