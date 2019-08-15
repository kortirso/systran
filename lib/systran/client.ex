defmodule Systran.Client do
  @moduledoc """
  Client requests
  """

  @base_url "https://api-platform.systran.net/"

  @doc """
  Performs a request

  ## Examples

      iex> Systran.Client.call(:post, "translation/text/translate", attrs)

      {:ok,
        %{
          "outputs" => [
            %{
              "output" => "Hola mundo",
              "stats" => %{}
            }
          ]
        }
      }

      {:error, :timeout}

      {:error,
        %{
          "error" => %{
            "info" => %{"statusCode" => 400},
            "message" => "no target provided",
            "statusCode" => 400
          }
        }
      }

  """
  @spec call(atom, String.t(), list) :: {}

  def call(type, endpoint, attrs) when is_atom(type) and is_binary(endpoint) and is_binary(attrs) do
    type
    |> fetch(endpoint, attrs)
    |> parse()
  end

  # MAIN FUNCTIONS
  # make post request
  defp fetch(:post, endpoint, attrs) do
    case HTTPoison.post(url(endpoint), attrs, headers(), options()) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} -> {:ok, body}
      {:ok, %HTTPoison.Response{body: body}} -> {:error, body}
      {:error, %HTTPoison.Error{reason: reason}} -> {:error, reason}
    end
  end

  # parse result
  defp parse({result, response}) when is_binary(response), do: {result, Poison.Parser.parse!(response)}
  defp parse(response), do: response

  # ADDITIONAL FUNCTIONS
  defp url(endpoint), do: @base_url <> endpoint

  defp headers, do: [{"Content-Type", "application/json"}]

  defp options, do: [ssl: [{:versions, [:'tlsv1.2']}], recv_timeout: 500]
end
