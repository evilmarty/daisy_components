defmodule Storybook.Components.TabItem do
  use PhoenixStorybook.Story, :component

  def function, do: &DaisyComponents.tab_item/1
  def render_source, do: :function

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{
          active: true,
        },
        slots: [
          ~s|Tab|,
        ]
      }
    ]
  end
end
