defmodule PentoWeb.SurveyLive.Component do
  use Phoenix.Component

  @doc """
    Renders a hero with title and inner block
  """
  attr :content, :string, required: true
  slot :inner_block, required: true

  def hero(assigns) do
    ~H"""
    <h1 class="font-heavy text-3xl">{@content}</h1>

    <h3>{render_slot(@inner_block)}</h3>
    """
  end

  @doc """
    Renders a title
  """
  attr :content, :string, required: true

  def title(assigns) do
    ~H"""
    <h1 class="font-heavy text-3xl">{@content}</h1>
    """
  end
end
