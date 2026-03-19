defmodule Storybook.Components.Dock do
  use PhoenixStorybook.Story, :component

  def function, do: &DaisyComponents.dock/1
  def render_source, do: :function

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{
          size: "md",
        },
        slots: [
          ~s|<:button label="Home" active>Home</:button>|,
          ~s|<:button label="Search">Search</:button>|,
        ]
      }
    ]
  end
end
