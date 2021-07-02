Citizen.registerCommand(
  "ping",
  (source, _, _) => {
    switch source {
    | source if source > 0 => {
        let source = #Int(source)

        let playerName: string = Citizen.invokeNative(Server.Cfx.getPlayerName, source)
        let latency: int = Citizen.invokeNative(Server.Cfx.getPlayerPing, source)

        let payload = #Object([
          (
            "args",
            #Array([
              #String(playerName),
              #String("PONG! Your latency is " ++ string_of_int(latency) ++ " ms."),
            ]),
          ),
          ("color", #Array([#Int(5), #Int(255), #Int(255)])),
        ])

        Citizen.emitNet("chat:addMessage", #Array([source, payload]))
      }
    | _ => ()
    }
  },
  false,
)
