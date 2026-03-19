defmodule Storybook.Components.Countdown do
  use PhoenixStorybook.Story, :component

  def function, do: &DaisyComponents.countdown/1
  def render_source, do: :function

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{
          value: 60,
          digits: 2,
        }
      }
    ]
  end
end
