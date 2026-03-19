defmodule Storybook.Components.Checkbox do
  use PhoenixStorybook.Story, :component

  def function, do: &DaisyComponents.checkbox/1
  def render_source, do: :function

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{
          color: "primary",
          size: "md",
        }
      }
    ]
  end
end
