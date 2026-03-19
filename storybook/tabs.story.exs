defmodule Storybook.Components.Tabs do
  use PhoenixStorybook.Story, :component

  def function, do: &DaisyComponents.tabs/1
  def render_source, do: :function

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{
          size: "md",
          placement: "top",
          style: "border",
        },
        slots: [
          ~s|<:tab active>Tab 1</:tab>|,
          ~s|<:tab>Tab 2</:tab>|,
          ~s|<:tab>Tab 3</:tab>|,
        ]
      }
    ]
  end
end
