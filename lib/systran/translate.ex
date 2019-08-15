defmodule Systran.Translate do
  @moduledoc """
  Client requests to Translate services
  """

  alias Systran.Client

  @doc """
  Translate text from source language to target language

  ## Example

      iex> Systran.Translate.translate(%{key: key, input: "hello world", source: "en", target: "es"})
      {:ok, %{"outputs" => [%{"output" => "Hola mundo", "stats" => %{}}]}}

  ### Options

      key - access key, optional if key exists in config
      input - text for translation, required
      source - source language, ISO 639-1 format (like "en"), required
      target - target language, ISO 639-1 format (like "ru"), required

  """
  @spec translate(map()) :: {:ok, %{}}

  def translate(%{} = attrs), do: Client.call(:post, "translation/text/translate", attrs)
end
