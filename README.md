# Daisy Components

[Daisy UI](https://daisyui.com) components built with Phoenix LiveView.

## Supported Components

The following components from DaisyUI are supported:

- `alert` (`<.alert>`)
- `avatar` (`<.avatar>`)
- `avatar_group` (`<.avatar_group>`)
- `badge` (`<.badge>`)
- `button` (`<.button>`)
- `card` (`<.card>`)
- `checkbox` (`<.checkbox>`)
- `collapse` (`<.collapse>`)
- `countdown` (`<.countdown>`)
- `divider` (`<.divider>`)
- `dock` (`<.dock>`)
- `dock_button` (`<.dock_button>`)
- `drawer` (`<.drawer>`)
- `dropdown` (`<.dropdown>`)
- `fieldset` (`<.fieldset>`)
- `hero` (`<.hero>`)
- `hover_3d` (`<.hover_3d>`)
- `input` (`<.input>`)
- `label` (`<.label>`)
- `loading` (`<.loading>`)
- `menu` (`<.menu>`)
- `menu_item` (`<.menu_item>`)
- `modal` (`<.modal>`)
- `progress` (`<.progress>`)
- `radio` (`<.radio>`)
- `range` (`<.range>`)
- `select` (`<.select>`)
- `stat` (`<.stat>`)
- `stats` (`<.stats>`)
- `swap` (`<.swap>`)
- `tab_item` (`<.tab_item>`)
- `tabs` (`<.tabs>`)
- `textarea` (`<.textarea>`)
- `toast` (`<.toast>`)
- `toggle` (`<.toggle>`)
- `tooltip` (`<.tooltip>`)

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `daisy_components` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:daisy_components, "~> 0.1.1"}
  ]
end
```

Update Tailwind CSS to include Daisy Components styles by adding the following line to your `app.css`:

```css
@plugin "daisyui";
@source "../../deps/daisy_components/**/*.ex";
```

If you are using `tailwind.config.js`, make sure to include the Daisy Components path:

```js
module.exports = {
  content: [
    //...
    "../../deps/daisy_components/**/*.ex" // <- reference DaisyComponents as content path
  ],
  //...
  plugins: [
    //...
    require("daisyui")  <- // add DaisyUI plugin
    //...
  ]
}
```

Add `DaisyComponents` to your helpers to access in your templates:

```elixir
defp html_helpers do
  quote do
    #...
    import DaisyComponents
  end
end
```

Include it in your `CoreComponents` or equivalent module:

```elixir
defmodule MyAppWeb.CoreComponents do
  use Phoenix.Component
  import DaisyComponents
  #...
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/daisy_components>.

## Storybook

Storybook is hosted in a standalone Phoenix app under `storybook_app/` to avoid
impacting the component library build.

From the repo root:

```sh
cd storybook_app
mix deps.get
mix assets.build
mix phx.server
```

Then open <http://localhost:4000/>. Story files live in `/storybook` at
the repo root and are loaded by `storybook_app`. Add new component stories
under `storybook/*.story.exs` and update indexes as needed.

## TODO

[ ] Add all components from Daisy UI.
