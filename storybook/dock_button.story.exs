defmodule Storybook.Components.DockButton do
  use PhoenixStorybook.Story, :component

  def function, do: &DaisyComponents.dock_button/1
  def render_source, do: :function

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{
          label: "Home",
          active: true,
        },
        slots: [
          ~s|<span class="text-lg">H</span>|,
        ]
      }
    ]
  end
end
