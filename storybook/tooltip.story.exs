defmodule Storybook.Components.Tooltip do
  use PhoenixStorybook.Story, :component

  def function, do: &DaisyComponents.tooltip/1
  def render_source, do: :function

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{
          tip: "Helpful tip",
          placement: "right",
        },
        slots: [
          ~s|<button class="btn">Hover me</button>|,
        ]
      }
    ]
  end
end
