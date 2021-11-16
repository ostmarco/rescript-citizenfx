let trace = message => Native.trace(message)

let getTickCount = Native.getTickCount

let invokeNative: (int, InputArgument.t) => 'a = (hash, arguments) => {
  Native.invokeNative(string_of_int(hash), InputArgument.unwrap(arguments))
}

let on = Native.on

let onNet = Native.onNet

let emit: (string, InputArgument.t) => unit = (eventName, arguments) => {
  Native.emit(eventName, InputArgument.unwrap(arguments))
}

let emitNet: (string, InputArgument.t) => unit = (eventName, arguments) => {
  Native.emitNet(eventName, InputArgument.unwrap(arguments))
}

let removeEventListener = Native.removeEventListener

let getPlayerIdentifiers = Native.getPlayerIdentifiers

let getPlayers = Native.getPlayers

let setTick = Native.setTick

let clearTick = Native.clearTick

let source = Native.source

let registerCommand = Native.registerCommand
