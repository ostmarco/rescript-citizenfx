let trace = message => Internal.trace(message)

let getTickCount = Internal.getTickCount

let invokeNative: (string, array<InputArgument.t>) => 'a = (hash, arguments) => {
  Internal.invokeNative(hash, Belt.Array.map(arguments, InputArgument.unwrap))
}

let on = Internal.on

let onNet = Internal.onNet

let emit: (string, array<InputArgument.t>) => unit = (eventName, args) => {
  Internal.emit(eventName, Belt.Array.map(args, InputArgument.unwrap))
}

let emitNet: (string, array<InputArgument.t>) => unit = (eventName, args) => {
  Internal.emitNet(eventName, Belt.Array.map(args, InputArgument.unwrap))
}

let removeEventListener = Internal.removeEventListener

let getPlayerIdentifiers = Internal.getPlayerIdentifiers

let getPlayers = Internal.getPlayers

let setTick = Internal.setTick

let clearTick = Internal.clearTick

let source = Internal.source
