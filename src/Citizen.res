let trace = message => External.trace(message)

let getTickCount = External.getTickCount

let invokeNative: (int, InputArgument.t) => 'a = (hash, arguments) => {
  External.invokeNative(string_of_int(hash), InputArgument.unwrap(arguments))
}

let on = External.on

let onNet = External.onNet

let emit: (string, InputArgument.t) => unit = (eventName, arguments) => {
  External.emit(eventName, InputArgument.unwrap(arguments))
}

let emitNet: (string, InputArgument.t) => unit = (eventName, arguments) => {
  External.emitNet(eventName, InputArgument.unwrap(arguments))
}

let removeEventListener = External.removeEventListener

let getPlayerIdentifiers = External.getPlayerIdentifiers

let getPlayers = External.getPlayers

let setTick = External.setTick

let clearTick = External.clearTick

let source = External.source

let registerCommand = External.registerCommand
