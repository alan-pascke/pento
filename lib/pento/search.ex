defmodule Pento.Search do
  alias Pento.Search.Products

  def change_product(%Products{} = product, attrs \\ %{}) do
    IO.inspect( product)
    Products.changeset(product, attrs)
  end

end
