defmodule PentoWeb.WrongLive do
  use Phoenix.LiveView, layout: {PentoWeb.LayoutView, "live.html"}

  def mount(_params, _session, socket) do
    {:ok, assign(socket, score: 0, message: "Make a guess:", time: time(), number: :rand.uniform(10))}
  end

  def render(assigns) do
    ~H"""
      <h1>Your score: <%= @score %></h1>
      <h2>
        <%= @message %>
        It's <%= @time %>
      </h2>
      <h2>
        <%= for n <- 1..10  do %>
          <a href="#" phx-click="guess" phx-value-number= {n}><%= n %></a>
        <% end %>
      </h2>
    """
  end

  def handle_event("guess", %{"number" => guess}=data, socket) do

    {guessNumber, _} = Integer.parse(guess)
    if guessNumber == socket.assigns.number do
      score = socket.assigns.score + 10
      message = "Your guess: #{guess}. You won. Search for the next number."
      number = :rand.uniform(10)
      {:noreply, assign(socket, message: message, score: score, number: number, time: time())}

    else
      score = socket.assigns.score - 1
      message = "Your guess: #{guess}. Wrong !. Guess again."
      number = socket.assigns.number
      {:noreply, assign(socket, message: message, score: score, number: number, time: time())}
    end
  end

  def time() do
    DateTime.utc_now() |> to_string()
  end
end
