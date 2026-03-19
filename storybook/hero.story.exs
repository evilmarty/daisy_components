defmodule Storybook.Components.Hero do
  use PhoenixStorybook.Story, :component

  def function, do: &DaisyComponents.hero/1
  def render_source, do: :function

  def variations do
    [
      %Variation{
        id: :default,
        slots: [
          ~s|<:overlay class="bg-base-200/50"></:overlay>|,
          ~s|<:content>
  <div class="p-6">Hero content</div>
</:content>|,
        ]
      }
    ]
  end
end
