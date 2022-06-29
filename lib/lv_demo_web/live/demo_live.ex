defmodule LvDemoWeb.DemoLive do
  use LvDemoWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div>Hello world</div>
    """
  end
end
