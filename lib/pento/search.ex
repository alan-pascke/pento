defmodule Pento.Search do
  alias Pento.Search.Products

  def change_product(%Products{} = product, attrs \\ %{}) do
    Products.changeset(product, attrs)
  end
end
