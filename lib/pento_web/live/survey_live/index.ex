defmodule PentoWeb.SurveyLive.Index do
  use PentoWeb, :live_view
  alias Pento.Survey
  alias PentoWeb.SurveyLive.Component
  alias PentoWeb.DemographicLive

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign_demographic}
  end

  defp assign_demographic(%{assigns: %{current_user: user}} = socket) do
    assign(
      socket,
      :demographic,
      Survey.get_demographic_by_user(user)
    )
  end
end
