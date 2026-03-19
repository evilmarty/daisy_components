defmodule Storybook.Components.Menu do
  use PhoenixStorybook.Story, :component

  def function, do: &DaisyComponents.menu/1
  def render_source, do: :function

  def variations do
    [
      %Variation{
        id: :default,
        slots: [
          ~s|<:item title="Home" />|,
          ~s|<:item title="Profile" />|,
          ~s|<:item title="Settings" />|,
        ]
      }
    ]
  end
end
