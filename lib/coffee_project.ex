defmodule CoffeeProject do
  @kinds [:arabica, :conilon]
  @types [:grão, :moido, :solúvel]

  @fake_coffee %{
    kind: :conilon,
    brand: "banana coffee",
    type: :moido,
    id: 28
  }

  def create(%{kind: kind, brand: _brand, type: type})
      when type in @types and kind in @kinds do
    {:ok, %{message: "Coffee created", id: Enum.random(0..100), status: :ok}}
  end

  def create(_params) do
    {:error, %{message: "Invalid params", status: :bad_request}}
  end

  def delete(28) do
    {:ok, %{message: "Coffee deleted", status: :ok, coffee: @fake_coffee}}
  end

  def delete(_id) do
    {:error, %{message: "Coffee not found", status: :not_found}}
  end

  def get(28) do
    {:ok, %{status: :ok, coffee: @fake_coffee}}
  end

  def get(_id) do
    {:error, %{message: "Coffee not found", status: :not_found}}
  end
end
