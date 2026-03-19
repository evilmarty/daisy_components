defmodule Storybook.Components.Drawer do
  use PhoenixStorybook.Story, :component

  def function, do: &DaisyComponents.drawer/1
  def render_source, do: :function

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{
          open: true,
        },
        slots: [
          ~s|<:content>
  <div class="p-4">Main content</div>
</:content>|,
          ~s|<:side>
  <div class="p-4">Sidebar</div>
</:side>|,
        ]
      }
    ]
  end
end
