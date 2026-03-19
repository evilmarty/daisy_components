# Storybook App

This Phoenix app hosts the component Storybook for the `daisy_components` library.
Stories live in the repo root under `/storybook`, and this app loads them without
affecting the library build.

## Usage

From the repo root:

```sh
cd storybook_app
mix deps.get
mix assets.build
mix phx.server
```

Then open <http://localhost:4000/> to view Storybook.

## Adding stories

Create or update story files under `../storybook`, for example:

```
../storybook/button.story.exs
../storybook/_components.index.exs
```
