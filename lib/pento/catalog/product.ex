defmodule Pento.Catalog.Product do
  alias Pento.Catalog.Product
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :name, :string
    field :description, :string
    field :unit_price, :float
    field :sku, :integer
    field :image_upload, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :description, :unit_price, :sku, :image_upload])
    |> validate_required([:name, :description, :unit_price, :sku])
    |> validate_length(:sku, is: 6) #verificar
    |> unique_constraint(:sku)
    |> validate_number(:unit_price, greater_than: 0.0)
  end

  def decrease_unit_price(%Product{} = product, value_to_subtract) do
    change(product, unit_price: product.unit_price - value_to_subtract)
  end

end
