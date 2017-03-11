defmodule MTG do
  use Application
  alias MTG.{Client, Response}

  Enum.each ~w(cards sets types supertypes subtypes formats)a, fn(method_name) ->
    def unquote(method_name)(opts \\ %{}), do:
      Client.get(
        "#{unquote(method_name)}",
        [],
        params: Keyword.get(opts, :params, %{}),
      )
      |> Response.get_key(unquote(method_name))
  end

  Enum.each ~w(card set)a, fn(method_name) ->
    def unquote(method_name)(id, opts \\ %{}), do:
      Client.get(
        "#{unquote(method_name)}s/#{id}",
        [],
        params: Keyword.get(opts, :params, %{}),
      )
      |> Response.get_key(unquote(method_name))
  end

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    # Define workers and child supervisors to be supervised
    children = [
      # Starts a worker by calling: MTG.Worker.start_link(arg1, arg2, arg3)
      # worker(MTG.Worker, [arg1, arg2, arg3]),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MTG.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
