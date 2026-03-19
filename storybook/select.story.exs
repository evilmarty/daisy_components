defmodule Storybook.Components.Select do
  use PhoenixStorybook.Story, :component

  def function, do: &DaisyComponents.select/1
  def render_source, do: :function

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{
          size: "md",
        },
        slots: [
          ~s|<:option value="1" selected>One</:option>|,
          ~s|<:option value="2">Two</:option>|,
        ]
      }
    ]
  end
end
