defmodule Blogger do
  @moduledoc """
  Documentation for `Blogger`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Blogger.hello()
      :world

  """
  def hello do
    :world
  end

  def fetch_blog do
    case HTTPoison.get("https://medium.com/podiihq/quick-connect-to-your-amazon-ec2-linux-instance-through-the-command-line-6c682960ef91") do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        IO.puts body
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.puts "Not found :("
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect reason
    end
  end

  def capitalize_these do
    your_input = IO.gets "Provide your input: "
    your_result = String.upcase(your_input)
    IO.puts "Your result is #{your_result}"
  end
end
