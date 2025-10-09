# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Pento.Repo.insert!(%Pento.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Pento.Catalog

products = [
  %{
    name: "Chess",
    description: "The classic strategy game",
    sku: 567_891,
    unit_price: 10.00
  },
  %{
    name: "Tic-Tac-Toe",
    description: "The game of Xs and Os",
    sku: 111_213,
    unit_price: 3.00
  },
  %{
    name: "Table Tennis",
    description: "Bat the ball back and forth. Don't miss!",
    sku: 152_223,
    unit_price: 12.00
  }
]

Enum.each(products, fn product ->
  Catalog.create_product(product)
end)

alias Pento.Accounts

users = [
  %{
    username: "user_1",
    email: "user1@example.com",
    password: "password1234"
  },
  %{
    username: "user_2",
    email: "user2@example.com",
    password: "password4567"
  },
  %{
    username: "user_3",
    email: "user3@example.com",
    password: "password7890"
  }
]

Enum.each(users, fn user ->
  Accounts.register_user(user)
end)
