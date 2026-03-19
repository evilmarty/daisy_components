defmodule Storybook.Components.Alert do
  use PhoenixStorybook.Story, :component

  def function, do: &DaisyComponents.alert/1
  def render_source, do: :function

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{
          color: "info",
          style: "soft",
          direction: "horizontal",
        },
        slots: [
          ~s|This is an alert.|,
        ]
      }
    ]
  end
end
