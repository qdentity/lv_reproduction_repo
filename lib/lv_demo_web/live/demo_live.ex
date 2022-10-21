defmodule LvDemoWeb.DemoLive do
  use LvDemoWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(unsigned_params, _uri, socket) do
    limit = Map.get(unsigned_params, "limit", "100") |> String.to_integer()

    socket = assign(socket, :limit, limit)
    {:noreply, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.link navigate={Routes.demo_path(LvDemoWeb.Endpoint, :index)}>Home</.link>
      <%= for i <- 0..@limit do %>
        <%= live_redirect to: Routes.demo2_path(LvDemoWeb.Endpoint, :index) do %>
          <div>item <%= i %></div>
        <% end %>
      <% end %>
      <%= live_patch("load more",
        to: Routes.demo_path(LvDemoWeb.Endpoint, :index, limit: @limit + 100)
      ) %>
    </div>
    """
  end
end
