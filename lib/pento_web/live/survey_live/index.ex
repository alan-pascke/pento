defmodule PentoWeb.SurveyLive.Index do
  use PentoWeb, :live_view

  alias Pento.Catalog
  alias PentoWeb.DemographicLive
  alias Pento.Survey
  alias PentoWeb.SurveyLive.Component
  alias PentoWeb.RatingLive

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign_demographic
     |> assign_products()}
  end

  defp assign_demographic(%{assigns: %{current_user: user}} = socket) do
    assign(
      socket,
      :demographic,
      Survey.get_demographic_by_user(user)
    )
  end

  @impl true
  def handle_info({:created_demographic, demographic}, socket) do
    {:noreply, handle_demographic_created(socket, demographic)}
  end

  def handle_demographic_created(socket, demographic) do
    socket
    |> put_flash(:info, "Demographic created successfully")
    |> assign(:demographic, demographic)
  end

  def assign_products(%{assigns: %{current_user: current_user}} = socket) do
    assign(socket, :products, list_products(current_user))
  end

  defp list_products(user) do
    Catalog.list_products_with_user_rating(user)
  end
end
