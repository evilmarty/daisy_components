defmodule Storybook.Components.AvatarGroup do
  use PhoenixStorybook.Story, :component

  def function, do: &DaisyComponents.avatar_group/1
  def render_source, do: :function

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{
          class: "-space-x-6",
        },
        slots: [
          ~s|<div class="avatar">
  <img src="https://placehold.co/48x48" alt="Avatar 1" />
</div>
<div class="avatar">
  <img src="https://placehold.co/48x48" alt="Avatar 2" />
</div>|,
        ]
      }
    ]
  end
end
