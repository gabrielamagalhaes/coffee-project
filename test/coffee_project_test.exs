defmodule CoffeeProjectTest do
  use ExUnit.Case

  describe "create/1" do
    test "when all params are valid returns a successfull response" do
      params = %{kind: :arabica, brand: "Banana coffee", type: :grão}

      response = CoffeeProject.create(params)

      assert {:ok, %{id: _id, message: "Coffee created", status: :ok}} = response
    end

    test "when there are invalid params returns an error" do
      params = %{kind: :random, brand: "Banana coffee", type: :grão}

      expected_response = {:error, %{message: "Invalid params", status: :bad_request}}

      response = CoffeeProject.create(params)

      assert response == expected_response
    end
  end
end
