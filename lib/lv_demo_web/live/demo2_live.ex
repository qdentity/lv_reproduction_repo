defmodule LvDemoWeb.Demo2Live do
  use LvDemoWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div>This is an item page</div>
    """
  end
end
