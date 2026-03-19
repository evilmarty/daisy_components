defmodule Storybook.Components.Stat do
  use PhoenixStorybook.Story, :component

  def function, do: &DaisyComponents.stat/1
  def render_source, do: :function

  def variations do
    [
      %Variation{
        id: :default,
        slots: [
          ~s|<:title>Downloads</:title>|,
          ~s|<:value>31K</:value>|,
          ~s|<:desc>Jan - Feb</:desc>|,
        ]
      }
    ]
  end
end
