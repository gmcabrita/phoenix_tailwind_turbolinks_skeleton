defmodule PhoenixTailwindTurbolinksSkeletonWeb.PageController do
  use PhoenixTailwindTurbolinksSkeletonWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def team(conn, _params) do
    render(conn, "team.html")
  end
end
