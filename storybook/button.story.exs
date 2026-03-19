defmodule Storybook.Components.Button do
  use PhoenixStorybook.Story, :component

  def function, do: &DaisyComponents.button/1
  def render_source, do: :function

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{
          color: "primary",
        },
        slots: [
          ~s|Button|,
        ]
      }
    ]
  end
end
