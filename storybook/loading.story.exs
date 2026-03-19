defmodule Storybook.Components.Loading do
  use PhoenixStorybook.Story, :component

  def function, do: &DaisyComponents.loading/1
  def render_source, do: :function

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{
          style: "spinner",
          size: "md",
        }
      }
    ]
  end
end
