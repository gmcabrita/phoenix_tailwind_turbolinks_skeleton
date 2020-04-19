defmodule PhoenixTailwindTurbolinksSkeletonWeb.SharedView do
  use PhoenixTailwindTurbolinksSkeletonWeb, :view

  def nav(assigns) do
    render "nav.html", assigns
  end

  def nav_item(assigns) do
    render "nav_item.html", assigns
  end

  def nav_item_small(assigns) do
    render "nav_item_small.html", assigns
  end
end