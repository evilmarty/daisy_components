defmodule Storybook.Components.Fieldset do
  use PhoenixStorybook.Story, :component

  def function, do: &DaisyComponents.fieldset/1
  def render_source, do: :function

  def variations do
    [
      %Variation{
        id: :default,
        slots: [
          ~s|<:legend>Account</:legend>|,
          ~s|<:label>Helper text</:label>|,
          ~s|<input class="input" placeholder="Name" />|,
        ]
      }
    ]
  end
end
