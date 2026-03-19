defmodule Storybook.Components.Modal do
  use PhoenixStorybook.Story, :component

  def function, do: &DaisyComponents.modal/1
  def render_source, do: :function

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{
          open: true,
          vertical: "middle",
          horizontal: "end",
        },
        slots: [
          ~s|<h3 class="font-bold text-lg">Modal title</h3>
<p class="py-4">Modal content</p>|,
          ~s|<:action>
  <button class="btn">Close</button>
</:action>|,
        ]
      }
    ]
  end
end
