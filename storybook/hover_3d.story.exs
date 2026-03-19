defmodule Storybook.Components.Hover3d do
  use PhoenixStorybook.Story, :component

  def function, do: &DaisyComponents.hover_3d/1
  def render_source, do: :function

  def variations do
    [
      %Variation{
        id: :default,
        slots: [
          ~s|<div class="p-6 bg-base-200 rounded-box">Hover me</div>|,
        ]
      }
    ]
  end
end
