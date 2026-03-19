defmodule Storybook.Components.Divider do
  use PhoenixStorybook.Story, :component

  def function, do: &DaisyComponents.divider/1
  def render_source, do: :function

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{
          color: "primary",
        },
        slots: [
          ~s|OR|,
        ]
      }
    ]
  end
end
