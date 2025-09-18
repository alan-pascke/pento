defmodule Pento.Search.Products do
  use Ecto.Schema
  import Ecto.Changeset

  # Embedded schema for the SKU search form
  @primary_key false
  embedded_schema do
    field :sku, :string
  end

  # Changeset with SKU validation (only 6 digits)
  def changeset(search, attrs) do
    search
    |> cast(attrs, [:sku])
    |> validate_required([:sku])
    |> validate_format(:sku, ~r/^\d{6}$/, message: "SKU must be exactly 6 digits.")
  end
end
