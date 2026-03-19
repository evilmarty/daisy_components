defmodule Storybook.Components.Swap do
  use PhoenixStorybook.Story, :component

  def function, do: &DaisyComponents.swap/1
  def render_source, do: :function

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{
          active: true,
          style: "flip",
        },
        slots: [
          ~s|<:on>On</:on>|,
          ~s|<:off>Off</:off>|,
        ]
      }
    ]
  end
end
