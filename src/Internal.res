@val external trace: @unwrap [#String(string) | #Array(array<string>)] => unit = "Citizen.trace"

@val external getTickCount: unit => int = "Citizen.getTickCount"

@val @variadic
external invokeNative: (string, array<'a>) => 'b = "Citizen.invokeNative"

@val external on: (string, 'a) => unit = "on"

@val external onNet: (string, 'a) => unit = "onNet"

@val @variadic external emit: (string, array<'a>) => unit = "emit"

@val @variadic external emitNet: (string, array<'a>) => unit = "emitNet"

@val external removeEventListener: (string, 'a) => unit = "removeEventListener"

@val
external getPlayerIdentifiers: @unwrap [#Int(int) | #String(string)] => array<string> =
  "getPlayerIdentifiers"

@val external getPlayers: unit => array<int> = "getPlayers"

@val external setTick: 'a => int = "setTick"

@val external clearTick: int => unit = "clearTick"

@val external source: string = "global.source"
