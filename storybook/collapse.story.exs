defmodule Storybook.Components.Collapse do
  use PhoenixStorybook.Story, :component

  def function, do: &DaisyComponents.collapse/1
  def render_source, do: :function

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{
          open: true,
          icon: "arrow",
        },
        slots: [
          ~s|<:title>Details</:title>|,
          ~s|Hidden content|,
        ]
      }
    ]
  end
end
