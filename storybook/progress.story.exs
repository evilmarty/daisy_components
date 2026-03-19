defmodule Storybook.Components.Progress do
  use PhoenixStorybook.Story, :component

  def function, do: &DaisyComponents.progress/1
  def render_source, do: :function

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{
          color: "primary",
        }
      }
    ]
  end
end
