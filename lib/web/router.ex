defmodule MarsRover.Web.Router do
  use Plug.Router

  plug(Plug.Parsers, parsers: [:json], json_decoder: Poison)
  plug(:match)
  plug(:dispatch)

  get "/ping", do: send_resp(conn, 200, Poison.encode!(%{message: "pong"}))

  match(_) do
    send_resp(conn, 404, "")
  end
end
