defmodule Storybook.Components.Textarea do
  use PhoenixStorybook.Story, :component

  def function, do: &DaisyComponents.textarea/1
  def render_source, do: :function

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{
          size: "md",
        },
        slots: [
          ~s|Textarea content|,
        ]
      }
    ]
  end
end
