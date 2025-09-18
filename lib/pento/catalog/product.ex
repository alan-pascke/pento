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
    |> unique_constraint(:sku)
    |> validate_number(:unit_price, greater_than: 0.0)
    |> validate_digits(:sku, 6)
  end

  def decrease_unit_price(%Product{} = product, value_to_subtract) do
    change(product, unit_price: product.unit_price - value_to_subtract)
  end

  # validate if field contains a specific number of digits
  defp validate_digits(changeset, field ,digits) do
    validate_change(changeset, field, fn _, value ->
      field_str = Integer.to_string(value)

      if String.length(field_str) == digits do
        []
      else
        [{field, "must be #{digits} digits long"}]
      end
    end)
  end
end
