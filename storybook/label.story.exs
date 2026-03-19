defmodule Storybook.Components.Label do
  use PhoenixStorybook.Story, :component

  def function, do: &DaisyComponents.label/1
  def render_source, do: :function

  def variations do
    [
      %Variation{
        id: :default,
        slots: [
          ~s|Label|,
        ]
      }
    ]
  end
end
