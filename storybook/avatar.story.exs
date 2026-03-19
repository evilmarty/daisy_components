defmodule Storybook.Components.Avatar do
  use PhoenixStorybook.Story, :component

  def function, do: &DaisyComponents.avatar/1
  def render_source, do: :function

  def variations do
    [
      %Variation{
        id: :image,
        attributes: %{
          status: "online",
        },
        slots: [
          ~s|<img src="https://placehold.co/64x64" alt="Avatar" />|,
        ]
      },
      %Variation{
        id: :text,
        attributes: %{
          status: "online",
          placeholder: true
        },
        slots: [
          ~s|<div class="bg-neutral text-neutral-content w-16 rounded-full"><span class="text-xl">AI</span></div>|,
        ]
      }
    ]
  end
end
