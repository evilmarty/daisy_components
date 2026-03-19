defmodule Storybook.Components.MenuItem do
  use PhoenixStorybook.Story, :component

  def function, do: &DaisyComponents.menu_item/1
  def render_source, do: :function

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{
          title: "Menu item",
        }
      }
    ]
  end
end
