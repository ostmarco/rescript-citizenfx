type callback<'a> = array<'a> => unit

@val @variadic external trace: array<string> => unit = "Citizen.trace"

@val @variadic
external invokeNative: (string, array<'a>) => 'b = "Citizen.invokeNative"

@val external on: (string, callback<'a>) => unit = "on"

@val external onNet: (string, callback<'a>) => unit = "onNet"

@val @variadic external emit: (string, array<'a>) => unit = "emit"

@val @variadic external emitNet: (string, array<'a>) => unit = "emitNet"

@val external setTick: callback<'a> => int = "setTick"

@val external clearTick: int => unit = "clearTick"

@val external getPlayerIdentifiers: int => array<string> = "getPlayerIdentifiers"

@val external getPlayers: unit => array<int> = "getPlayers"

@val external source: string = "global.source"
