defmodule MTG.Client do
  use HTTPoison.Base

  def process_url(endpoint) do
    "https://api.magicthegathering.io/v1/" <> endpoint
  end

  def process_response_body(body) do
    body
    |> Poison.decode!(keys: :atoms)
  end
end
