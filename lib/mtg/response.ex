defmodule MTG.Response do
  def get_key({:ok, %HTTPoison.Response{body: %{error: error}}} = b, _) do
      {:error, error}
  end

  def get_key({:ok, %HTTPoison.Response{body: body}}, key) do
    case Map.get(body, key) do
      nil -> {:error, body}
      result -> {:ok, result}
    end
  end
end
