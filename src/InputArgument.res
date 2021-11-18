external identity: 'a => 'b = "%identity"

type rec t = [
  | #Undefined
  | #Int(int)
  | #Bool(bool)
  | #Float(float)
  | #String(string)
  | #Array(array<t>)
  | #Dictionary(array<(string, t)>)
]

let rec unwrap: t => 'a = inputArgument =>
  switch inputArgument {
  | #Undefined => identity(None)
  | #Int(value) => identity(value)
  | #Bool(value) => identity(value)
  | #Float(value) => identity(value)
  | #String(value) => identity(value)
  | #Array(value) => identity(Belt.Array.map(value, unwrap))
  | #Dictionary(value) => {
      let dictionary: Js.Dict.t<'a> = Js.Dict.empty()

      Belt.Array.forEach(value, ((key, value)) => {
        Js.Dict.set(dictionary, key, unwrap(value))
      })

      identity(dictionary)
    }
  }
