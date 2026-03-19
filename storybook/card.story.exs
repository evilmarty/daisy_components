defmodule Storybook.Components.Card do
  use PhoenixStorybook.Story, :component

  def function, do: &DaisyComponents.card/1
  def render_source, do: :function

  def variations do
    [
      %Variation{
        id: :default,
        slots: [
          ~s|<:title>Card title</:title>|,
          ~s|Card content goes here.|,
          ~s|<:actions>
  <button class="btn btn-primary">Action</button>
</:actions>|,
        ]
      }
    ]
  end
end
