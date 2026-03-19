defmodule Storybook.Components.Toast do
  use PhoenixStorybook.Story, :component

  def function, do: &DaisyComponents.toast/1
  def render_source, do: :function

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{
          horizontal: "end",
          vertical: "top",
        },
        slots: [
          ~s|<div class="alert alert-success">
  <span>Saved!</span>
</div>|,
        ]
      }
    ]
  end
end
