defmodule StorybookAppWeb.Router do
  use StorybookAppWeb, :router
  import PhoenixStorybook.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {StorybookAppWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/" do
    storybook_assets()
  end

  scope "/", StorybookAppWeb do
    pipe_through :browser

    live_storybook "/", backend_module: StorybookAppWeb.Storybook
  end
end
