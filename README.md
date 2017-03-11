# Magic The Gathering API - Elixir wrapper

This is a simple Elixir wrapper around the [Magic The Gathering API]

## Installation

First, add MTG to your `mix.exs` dependencies:

```elixir
def deps do
  [{:mtg, "~> 0.1.0"}]
end
```

and run `$ mix deps.get`.

## Usage

All the endpoints detailed in the [Official API docs] are available. Here's a run down of them:

* **Get all Cards**

```elixir
iex>{:ok, cards} = MTG.cards
```

* **Get a specific card**

```elixir
iex>{:ok, card} = MTG.card(386616)
```

* **Advanced card search**

```elixir
iex>{:ok, powerful_cards} = MTG.cards(params: %{power: "gt3"})

iex>{:ok, ktk_cards} = MTG.cards(params: %{set: "ktk"})
```

* **Get all sets**

```elixir
iex>{:ok, sets} = MTG.sets
```

* **Get a specific set**

```elixir
iex>{:ok, sets} = MTG.set("ktk")
```

* **Generate a booster pack**

```elixir
iex>{:ok, cards} = MTG.booster("ktk")
```

* **Get all types**

```elixir
iex>{:ok, cards} = MTG.types
```

* **Get all supertypes**

```elixir
iex>{:ok, cards} = MTG.supertypes
```

* **Get all subtypes**

```elixir
iex>{:ok, cards} = MTG.subtypes
```

* **Get all formats**

```elixir
iex>{:ok, cards} = MTG.formats
```

See [Advanced Usage] for more info

[Magic The Gathering API]: http://magicthegathering.io/
[Official API docs]: https://docs.magicthegathering.io/
[Advanced Usage]: https://docs.magicthegathering.io/#advanced-usage

# License

```
Copyright © 2017 Miguel Palhas

This work is free. You can redistribute it and/or modify it under the
terms of the MIT License. See the LICENSE file for more details.
```
