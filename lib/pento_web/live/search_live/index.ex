defmodule PentoWeb.SearchLive.Index do
  use PentoWeb, :live_view
  alias Pento.Search
  alias Pento.Search.Products

  def mount(_params, _session, socket) do

    {:ok,
     socket
     |> assign(:product, %Products{})
     |> clear_form()}

  end

  def clear_form(socket) do
    changeset =
      socket.assigns.product
      |> Search.change_product()

    socket |> assign_form(changeset)
  end

  def assign_form(socket, changeset) do
    assign(socket, :form, to_form(changeset))
  end

  def handle_event(
    "validate",
    %{"products" => product_params},
    %{assigns: %{product: product}} = socket
  ) do
    changeset =
      product
      |> Search.change_product(product_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end
end
