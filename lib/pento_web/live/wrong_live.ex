defmodule PentoWeb.WrongLive do
  use PentoWeb, :live_view

  def mount(_params, _session, socket) do
    {
      :ok,
      assign(
        socket,
        score: 0,
        message: "Make a guess:",
        time: time(),
        initial_number: random_number()
      )
    }
  end

  def render(assigns) do
    ~H"""
    <h1 class="mb-4 text-4xl font-extrabold">Your score: {@score}</h1>

    <h2>It's {@time} <br /> {@message}</h2>
     <br />
    <h2>
      <%= for n <- 1..10 do %>
        <.link
          class="bg-blue-500 hover:bg-blue-700
      text-white font-bold py-2 px-4 border border-blue-700 rounded m-1"
          phx-click="guess"
          phx-value-number={n}
        >
          {n}
        </.link>
      <% end %>
    </h2>
     <br />
    <pre>
      {@current_user.username}
      {@session_id}
    </pre>
    """
  end

  def handle_event("guess", %{"number" => guess}, socket) do
    initial_number = socket.assigns.initial_number
    {message, score} = check_number({guess == initial_number, socket, guess})

    {
      :noreply,
      assign(
        socket,
        message: message,
        score: score,
        time: time(),
        initial_number: random_number()
      )
    }
  end

  def check_number({true, socket, guess}) do
    message = "Your guess: #{guess}. Correct. You Win! "
    score = socket.assigns.score + 1
    {message, score}
  end

  def check_number({false, socket, guess}) do
    message = "Your guess: #{guess}. Wrong. Guess again. "
    score = socket.assigns.score - 1
    {message, score}
  end

  def random_number() do
    Enum.random(1..10)
    |> to_string()
  end

  def time() do
    DateTime.utc_now()
    |> to_string
  end
end
