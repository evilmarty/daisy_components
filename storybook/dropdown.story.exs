defmodule Storybook.Components.Dropdown do
  use PhoenixStorybook.Story, :component

  def function, do: &DaisyComponents.dropdown/1
  def render_source, do: :function

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{
          open: true,
          horizontal: "right",
          vertical: "bottom",
        },
        slots: [
          ~s|<:toggle>Toggle</:toggle>|,
          ~s|<ul class="menu bg-base-200 rounded-box p-2 w-40">
  <li><a href="#">Item 1</a></li>
  <li><a href="#">Item 2</a></li>
</ul>|,
        ]
      }
    ]
  end
end
