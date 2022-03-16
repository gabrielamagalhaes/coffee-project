defmodule CoffeeProject do
  @kinds [:arabica, :conilon]
  @types [:grão, :moido, :solúvel]

  def create(%{kind: kind, brand: _brand, type: type})
      when type in @types and kind in @kinds do
    {:ok, %{message: "Coffee created", id: Enum.random(0..100), status: :ok}}
  end

  def create(_params) do
    {:error, %{message: "Invalid params", status: :bad_request}}
  end
end
