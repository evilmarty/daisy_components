defmodule Storybook.Components.Stats do
  use PhoenixStorybook.Story, :component

  def function, do: &DaisyComponents.stats/1
  def render_source, do: :function

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{
          direction: "horizontal",
        },
        slots: [
          ~s|<:stat title="Downloads" value="31K" desc="Jan - Feb" />|,
          ~s|<:stat title="New Users" value="4,200" desc="Up 10%" />|,
        ]
      }
    ]
  end
end
