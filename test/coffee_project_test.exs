defmodule CoffeeProjectTest do
  use ExUnit.Case, async: true

  setup do
    id = 28

    coffee = %{brand: "banana coffee", id: 28, kind: :conilon, type: :moido}

    {:ok, id: id, coffee: coffee}
  end

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

  describe "delete/1" do
    test "when the coffee exists, deletes the coffee", %{id: id, coffee: coffee} do
      expected_response =
        {:ok,
         %{
           coffee: coffee,
           message: "Coffee deleted",
           status: :ok
         }}

      response = CoffeeProject.delete(id)

      assert response == expected_response
    end

    # the test below I created myself to improve my studies
    test "when coffee doesn't exists, returns an error message" do
      id = 20

      expected_response = {:error, %{message: "Coffee not found", status: :not_found}}

      response = CoffeeProject.delete(id)

      assert response == expected_response
    end
  end

  describe "get/1" do
    test "when the coffee exists, get the coffee", %{id: id, coffee: coffee} do
      expected_response =
        {:ok,
         %{
           coffee: coffee,
           status: :ok
         }}

      response = CoffeeProject.get(id)

      assert response == expected_response
    end

    # the test below I created myself to improve my studies
    test "when coffee doesn't exists, can't get coffee" do
      id = 20

      expected_response = {:error, %{message: "Coffee not found", status: :not_found}}

      response = CoffeeProject.get(id)

      assert response == expected_response
    end
  end

  
end
