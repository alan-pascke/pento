defmodule Pento.Survey.Rating do
  alias Pento.Catalog.Product
  alias Pento.Accounts.User

  import Ecto.Changeset
  
  use Ecto.Schema


  schema "ratings" do
    field :stars, :integer
    belongs_to :user, User
    belongs_to :product, Product

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(rating, attrs) do
    rating
    |> cast(attrs, [:stars, :user_id, :product_id])
    |> validate_required([:stars, :user_id, :product_id])
    |> validate_inclusion(:stars, 1..5)
    |> unique_constraint(:product_id, name: :index_ratings_on_user_product)
  end
end
