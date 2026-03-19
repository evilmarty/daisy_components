defmodule Storybook.Components.Badge do
  use PhoenixStorybook.Story, :component

  def function, do: &DaisyComponents.badge/1
  def render_source, do: :function

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{
          color: "primary",
          size: "md",
          style: "outline",
        },
        slots: [
          ~s|Badge|,
        ]
      }
    ]
  end
end
