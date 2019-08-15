defmodule Systran.TranslateTest do
  use ExUnit.Case
  alias Systran.Translate

  test "request for translating text with invalid attrs" do
    {:error, %{"error" => %{"info" => info, "message" => message, "statusCode" => status_code}}} = Translate.translate(%{input: "hello world", source: "en"})

    assert info == %{"statusCode" => 400}
    assert message == "no target provided"
    assert status_code == 400
  end

  test "request for translating text" do
    {:ok, %{"outputs" => [%{"output" => result}]}} = Translate.translate(%{input: "hello world", source: "en", target: "es"})

    assert result == "hola mundo"
  end
end
