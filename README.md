# Systran

API Wrapper for SYSTRAN translation services with Elixir

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `systran` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:systran, "~> 0.1.0"}
  ]
end
```

## Get access to API

### Getting a SYSTRAN API KEY

To make api requests in Systran you must include access key in request params.

Instruction for getting access key is [here](https://platform.systran.net/index)

### Configuration

The default behaviour is to configure using the application environment:

In config/config.exs, add:

```elixir
config :systran, api_key: "API_KEY"
```

## Translate services

### Translation

Request for translating text is #translate.

```elixir
Systran.Translate.translate(%{input: "Hello", source: "en", target: "ru"})
```

#### Options

    key - access key, optional if key exists in config
    input - text for translation, required
    source - source language, ISO 639-1 format (like "en"), optional
    target - target language, ISO 639-1 format (like "ru"), required

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kortirso/systran.

## License

The package is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Disclaimer

Use this package at your own peril and risk.

## Documentation

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/systran](https://hexdocs.pm/systran).

