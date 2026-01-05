defmodule DaisyComponents do
  use Phoenix.Component

  @moduledoc """
  Phoenix Components for DaisyUI components.
  """

  @doc """
  Renders an alert box.
  https://daisyui.com/components/alert/

  ## Examples

      <.alert color="info" style="soft" position="horizontal">
        This is an info alert.
      </.alert>
  """
  @alert_colors %{
    "error" => "alert-error",
    "warning" => "alert-warning",
    "info" => "alert-info",
    "success" => "alert-success"
  }
  @alert_styles %{
    "soft" => "alert-soft",
    "dash" => "alert-dash",
    "outline" => "alert-outline"
  }
  @alert_directions %{
    "vertical" => "alert-vertical",
    "horizontal" => "alert-horizontal"
  }
  attr(:tag, :string, default: "div")

  attr(:color, :string,
    values: Map.keys(@alert_colors),
    doc: "the alert color to use"
  )

  attr(:style, :string,
    values: Map.keys(@alert_styles),
    doc: "the alert style to use"
  )

  attr(:direction, :string, values: Map.keys(@alert_directions), doc: "the alert position to use")
  attr(:class, :any, default: nil)
  attr(:overrideclass, :any)
  attr(:rest, :global, doc: "the arbitrary HTML attributes to add to the alert container")
  slot(:inner_block, required: true)

  def alert(assigns) do
    assigns
    |> assign(:baseclass, [
      "alert",
      fetch_value!(@alert_colors, assigns[:color]),
      fetch_value!(@alert_styles, assigns[:style]),
      fetch_value!(@alert_directions, assigns[:direction])
    ])
    |> update(:rest, &Map.put(&1, :role, "alert"))
    |> basic_tag()
  end

  @doc """
  Renders an avatar.
  https://daisyui.com/components/avatar/

  ## Examples

      <.avatar status="online">
        <img src="user_avatar.png" alt="User Avatar" />
      </.avatar>

      <.avatar placeholder={true} status="offline">
        <span>AB</span>
      </.avatar>

  """
  @avatar_statuses %{
    "online" => "avatar-online",
    "offline" => "avatar-offline"
  }
  attr(:placeholder, :boolean, default: false)

  attr(:status, :string,
    values: Map.keys(@avatar_statuses),
    doc: "the status of the avatar"
  )

  attr(:tag, :string, default: "div")
  attr(:class, :any, default: nil)
  attr(:overrideclass, :any)
  attr(:rest, :global)
  slot(:inner_block, required: true)

  def avatar(assigns) do
    assigns
    |> assign(:baseclass, [
      "avatar",
      assigns[:placeholder] && "avatar-placeholder",
      fetch_value!(@avatar_statuses, assigns[:status])
    ])
    |> basic_tag()
  end

  @doc """
  Container for grouping multiple avatars
  https://daisyui.com/components/avatar/#avatar-group

  ## Examples

      <.avatar_group>
        <.avatar>
          <img src="user1.png" alt="User 1" />
        </.avatar>
        <.avatar>
          <img src="user2.png" alt="User 2" />
        </.avatar>
        <.avatar>
          <img src="user3.png" alt="User 3" />
        </.avatar>
      </.avatar_group>

  """
  attr(:tag, :string, default: "div")
  attr(:class, :any, default: nil)
  attr(:overrideclass, :any)
  attr(:rest, :global)
  slot(:inner_block, required: true)

  def avatar_group(assigns) do
    assigns = merge_assigns(assigns, :rest, [:tag, :class, :overrideclass])

    ~H"""
    <.basic_tag baseclass="avatar-group" {@rest}>{render_slot(@inner_block)}</.basic_tag>
    """
  end

  @doc """
  Renders a badge.
  https://daisyui.com/components/badge/

  ## Examples

      <.badge color="primary" size="md">New</.badge>
      <.badge color="success" style="outline" size="lg">Success</.badge>

  """
  @badge_colors %{
    "neutral" => "badge-neutral",
    "primary" => "badge-primary",
    "secondary" => "badge-secondary",
    "accent" => "badge-accent",
    "info" => "badge-info",
    "success" => "badge-success",
    "warning" => "badge-warning",
    "error" => "badge-error"
  }
  @badge_sizes %{
    "xs" => "badge-xs",
    "sm" => "badge-sm",
    "md" => "badge-md",
    "lg" => "badge-lg",
    "xl" => "badge-xl"
  }
  @badge_styles %{
    "soft" => "badge-soft",
    "outline" => "badge-outline",
    "dash" => "badge-dash",
    "ghost" => "badge-ghost"
  }

  attr(:color, :string, values: Map.keys(@badge_colors), doc: "the color of the badge")
  attr(:style, :string, values: Map.keys(@badge_styles), doc: "the style of the badge")
  attr(:size, :string, values: Map.keys(@badge_sizes), doc: "the size of the badge")
  attr(:tag, :string, default: "span")
  attr(:class, :any, default: nil)
  attr(:overrideclass, :any)
  attr(:rest, :global)
  slot(:inner_block, required: true)

  def badge(assigns) do
    assigns
    |> assign(:baseclass, [
      "badge",
      fetch_value!(@badge_colors, assigns[:color]),
      fetch_value!(@badge_sizes, assigns[:size]),
      fetch_value!(@badge_styles, assigns[:style])
    ])
    |> basic_tag()
  end

  @doc """
  Renders a button with navigation support.
  https://daisyui.com/components/button/

  ## Examples

      <.button>Send!</.button>
      <.button phx-click="go" color="primary">Send!</.button>
      <.button navigate={~p"/"}>Home</.button>
  """
  @button_colors %{
    "primary" => "btn-primary",
    "secondary" => "btn-secondary",
    "neutral" => "btn-neutral",
    "accent" => "btn-accent",
    "error" => "btn-error",
    "warning" => "btn-warning",
    "info" => "btn-info",
    "success" => "btn-success"
  }
  @button_sizes %{
    "xs" => "btn-xs",
    "sm" => "btn-sm",
    "md" => "btn-md",
    "lg" => "btn-lg",
    "xl" => "btn-xl"
  }
  @button_styles %{
    "outline" => "btn-outline",
    "dash" => "btn-dash",
    "soft" => "btn-soft",
    "ghost" => "btn-ghost",
    "link" => "btn-link"
  }
  @button_shapes %{
    "circle" => "btn-circle",
    "square" => "btn-square",
    "block" => "btn-block",
    "wide" => "btn-wide"
  }
  attr(:color, :string,
    values: Map.keys(@button_colors),
    doc: "the button color to use"
  )

  attr(:size, :string,
    values: Map.keys(@button_sizes),
    doc: "the button size to use (xs, sm, md, lg, xl)"
  )

  attr(:style, :string,
    values: Map.keys(@button_styles),
    doc: "the button style to use (solid, outline, ghost, link)"
  )

  attr(:shape, :string, values: Map.keys(@button_shapes), doc: "the button shape to use")

  attr(:tag, :string, default: "button")
  attr(:class, :any, default: nil)
  attr(:overrideclass, :any)
  attr(:rest, :global, include: ~w(href navigate patch method download name value disabled type))

  slot(:inner_block, required: true)

  def button(%{rest: rest} = assigns) do
    baseclass = [
      "btn",
      rest[:disabled] && "btn-disabled",
      fetch_value!(@button_colors, assigns[:color]),
      fetch_value!(@button_sizes, assigns[:size]),
      fetch_value!(@button_styles, assigns[:style]),
      fetch_value!(@button_shapes, assigns[:shape])
    ]

    if assigns[:tag] == "a" || rest[:href] || rest[:navigate] || rest[:patch] do
      assigns = assign_override(assigns, baseclass)

      ~H"""
      <.link
        class={@overrideclass}
        {assigns_to_attributes(@rest, [:value, :type, :disabled])}
      >{render_slot(@inner_block)}</.link>
      """
    else
      assigns =
        assigns
        |> assign(:baseclass, baseclass)
        |> merge_assigns(:rest, [:tag, :baseclass, :class, :overrideclass])

      ~H"""
      <.basic_tag
        {assigns_to_attributes(@rest, [:href, :navigate, :patch, :method, :download])}
      >{render_slot(@inner_block)}</.basic_tag>
      """
    end
  end

  @doc """
  Renders a card component.
  https://daisyui.com/components/card/

  ## Examples

      <.card size="md" style="border">
        <:title>Card Title</:title>
        Card content goes here.
        <:actions>
          <.button>Action 1</.button>
          <.button>Action 2</.button>
        </:actions>
      </.card>

  """
  @card_sizes %{
    "xs" => "card-xs",
    "sm" => "card-sm",
    "md" => "card-md",
    "lg" => "card-lg",
    "xl" => "card-xl"
  }
  @card_styles %{
    "dash" => "card-dash",
    "border" => "card-border"
  }
  @card_mods %{
    "image-full" => "image-full",
    "side" => "card-side"
  }
  attr(:size, :string,
    values: Map.keys(@card_sizes),
    doc: "the size of the card"
  )

  attr(:style, :string, values: Map.keys(@card_styles), doc: "the style of the card")
  attr(:mod, :string, values: Map.keys(@card_mods), doc: "the modifier of the card")

  attr(:tag, :string, default: "div")
  attr(:class, :any, default: nil)
  attr(:overrideclass, :any)
  attr(:rest, :global)
  slot(:inner_block, required: true)

  slot :title do
    attr(:tag, :string)
    attr(:class, :any)
  end

  slot :actions do
    attr(:tag, :string)
    attr(:class, :any)
  end

  slot :image do
    attr(:tag, :string)
    attr(:class, :any)
    attr(:placement, :string)
  end

  def card(assigns) do
    assigns =
      assign(assigns, :baseclass, [
        "card",
        fetch_value!(@card_sizes, assigns[:size]),
        fetch_value!(@card_styles, assigns[:style]),
        fetch_value!(@card_mods, assigns[:mod])
      ])
      |> merge_assigns(:rest, [:tag, :baseclass, :class, :overrideclass])

    ~H"""
    <.basic_tag {@rest}>
      <.basic_tag
        :for={image <- @image}
        :if={image[:placement] != "bottom"}
        tag={image[:tag] || "figure"}
        {assigns_to_attributes(image, [:placement, :tag])}
      >{render_slot(image)}</.basic_tag>
      <div class="card-body">
        <.basic_tag
          :for={title <- @title} baseclass="card-title" tag={title[:tag] || "h2"} {assigns_to_attributes(title, [:tag])}
        >{render_slot(title)}</.basic_tag>
        {render_slot(@inner_block)}
        <.basic_tag
          :for={action <- @actions} baseclass="card-actions" {assigns_to_attributes(action)}
        >{render_slot(action)}</.basic_tag>
      </div>
      <.basic_tag
        :for={image <- @image}
        :if={image[:placement] == "bottom"}
        tag={image[:tag] || "figure"}
        {assigns_to_attributes(image, [:placement, :tag])}
      >{render_slot(image)}</.basic_tag>
    </.basic_tag>
    """
  end

  @checkbox_colors %{
    "primary" => "checkbox-primary",
    "secondary" => "checkbox-secondary",
    "neutral" => "checkbox-neutral",
    "accent" => "checkbox-accent",
    "error" => "checkbox-error",
    "warning" => "checkbox-warning",
    "info" => "checkbox-info",
    "success" => "checkbox-success"
  }
  @checkbox_sizes %{
    "xs" => "checkbox-xs",
    "sm" => "checkbox-sm",
    "md" => "checkbox-md",
    "lg" => "checkbox-lg",
    "xl" => "checkbox-xl"
  }
  @checkbox_styles %{
    "ghost" => "checkbox-ghost"
  }
  attr(:color, :string,
    values: Map.keys(@checkbox_colors),
    doc: "the color of the checkbox"
  )

  attr(:size, :string,
    values: Map.keys(@checkbox_sizes),
    doc: "the size of the checkbox"
  )

  attr(:style, :string,
    values: Map.keys(@checkbox_styles),
    doc: "the style of the checkbox"
  )

  attr(:type, :string, default: "checkbox")
  attr(:class, :any, default: nil)
  attr(:overrideclass, :any)

  attr(:rest, :global,
    include:
      ~w(accept autocomplete capture checked cols disabled form id list max maxlength min
                minlength multiple pattern placeholder readonly required rows size step value name)
  )

  def checkbox(assigns) do
    assigns
    |> assign(:baseclass, [
      "checkbox",
      fetch_value!(@checkbox_colors, assigns[:color]),
      fetch_value!(@checkbox_sizes, assigns[:size]),
      fetch_value!(@checkbox_styles, assigns[:style])
    ])
    |> assign(:tag, "input")
    |> merge_assigns(:rest, [:type])
    |> basic_tag()
  end

  @doc """
  Renders a collapse component.
  https://daisyui.com/components/collapse/

  ## Examples

      <.collapse open={true} icon="arrow">
        <:title>
          Click to Expand
        </:title>
        <:content>
          This is the hidden content that is revealed when the collapse is opened.
        </:content>
      </.collapse>

      <.collapse>
        <:title class="font-bold">
          Another Collapse
        </:title>
        More content here.
      </.collapse>

  """
  @collapse_icons %{
    "arrow" => "collapse-arrow",
    "plus" => "collapse-plus"
  }
  attr(:open, :boolean, default: false)
  attr(:icon, :string, values: Map.keys(@collapse_icons), doc: "the icon style of the collapse")
  attr(:tag, :string, default: "div")
  attr(:class, :any, default: nil)
  attr(:overrideclass, :any)
  attr(:rest, :global)
  slot(:inner_block)

  slot :title, required: true do
    attr(:tag, :string)
    attr(:class, :any)
  end

  slot :content do
    attr(:tag, :string)
    attr(:class, :any)
  end

  def collapse(assigns) do
    assigns =
      assign(assigns, :baseclass, [
        "collapse",
        assigns[:open] && "collapse-open",
        fetch_value!(@collapse_icons, assigns[:icon])
      ])
      |> merge_assigns(:rest, [:tag, :baseclass, :class, :overrideclass])

    ~H"""
    <.basic_tag {@rest}>
      <.basic_tag
        :for={title <- @title} baseclass="collapse-title" {assigns_to_attributes(title)}
      >{render_slot(title)}</.basic_tag>
      <.basic_tag :if={@content == []} baseclass="collapse-content">{render_slot(@inner_block)}</.basic_tag>
      <.basic_tag
        :for={content <- @content} baseclass="collapse-content" {assigns_to_attributes(content)}
      >{render_slot(content)}</.basic_tag>
    </.basic_tag>
    """
  end

  @doc """
  Renders a countdown component.
  https://daisyui.com/components/countdown/

  ## Examples

      <.countdown value={60} digits={2} />

  """
  attr(:value, :integer, required: true)
  attr(:digits, :integer, default: 1)
  attr(:tag, :string, default: "span")
  attr(:class, :any, default: nil)
  attr(:overrideclass, :any)
  attr(:rest, :global)

  def countdown(assigns) do
    assigns = merge_assigns(assigns, :rest, [:tag, :class, :overrideclass])

    ~H"""
    <.basic_tag baseclass="countdown" {@rest}>
      <span
        aria-live="polite"
        aria-label={@value}
        style={"--value:#{@value};--digits:#{@digits}"}
      >{@value}</span>
    </.basic_tag>
    """
  end

  @doc """
  Renders a divider.
  https://daisyui.com/components/divider/

  ## Examples

      <.divider color="primary" position="vertical" />
      <.divider color="accent" position="horizontal" placement="start" />

  """
  @divider_colors %{
    "neutral" => "divider-neutral",
    "primary" => "divider-primary",
    "secondary" => "divider-secondary",
    "accent" => "divider-accent",
    "info" => "divider-info",
    "success" => "divider-success",
    "warning" => "divider-warning",
    "error" => "divider-error"
  }
  @divider_directions %{
    "vertical" => "divider-vertical",
    "horizontal" => "divider-horizontal"
  }
  @divider_placements %{
    "start" => "divider-start",
    "end" => "divider-end"
  }
  attr(:color, :string, values: Map.keys(@divider_colors), doc: "the color of the divider")

  attr(:direction, :string,
    values: Map.keys(@divider_directions),
    doc: "the position of the divider"
  )

  attr(:placement, :string,
    values: Map.keys(@divider_placements),
    doc: "the placement of the divider"
  )

  attr(:tag, :string, default: "div")
  attr(:class, :any, default: nil)
  attr(:overrideclass, :any)
  attr(:rest, :global)
  slot(:inner_block)

  def divider(assigns) do
    assigns
    |> assign(:baseclass, [
      "divider",
      fetch_value!(@divider_colors, assigns[:color]),
      fetch_value!(@divider_directions, assigns[:direction]),
      fetch_value!(@divider_placements, assigns[:placement])
    ])
    |> basic_tag()
  end

  @doc """
  Renders a dock component.
  https://daisyui.com/components/dock/

  ## Examples

      <.dock size="md">
        <:button label="Home" active>
          <.icon name="hero-home" class="size-6" />
        </:button>
        <:button label="Search">
          <.icon name="hero-magnifying-glass" class="size-6" />
        </:button>
      </.dock>

  """
  @dock_sizes %{
    "xs" => "dock-xs",
    "sm" => "dock-sm",
    "md" => "dock-md",
    "lg" => "dock-lg",
    "xl" => "dock-xl"
  }
  attr(:size, :string,
    values: Map.keys(@dock_sizes),
    doc: "the size of the dock"
  )

  attr(:tag, :string, default: "div")
  attr(:class, :any, default: nil)
  attr(:overrideclass, :any)
  attr(:rest, :global)

  slot :button, required: true do
    attr(:tag, :string)
    attr(:active, :boolean)
    attr(:label, :string, required: true)
  end

  def dock(assigns) do
    assigns =
      assigns
      |> assign(:baseclass, [
        "dock",
        fetch_value!(@dock_sizes, assigns[:size])
      ])
      |> merge_assigns(:rest, [:tag, :baseclass, :class, :overrideclass])

    ~H"""
    <.basic_tag {@rest}>
      <.dock_button
        :for={button <- @button} {assigns_to_attributes(button)}
      >{render_slot(button)}</.dock_button>
    </.basic_tag>
    """
  end

  attr(:active, :boolean, default: false)
  attr(:label, :string, required: true)
  attr(:class, :any, default: nil)
  attr(:overrideclass, :any)

  attr(:rest, :global,
    include: ~w(tag href navigate patch method download name value disabled type)
  )

  slot(:inner_block, required: true)

  def dock_button(assigns) do
    assigns = assign_override(assigns, assigns[:active] && "dock-active")

    ~H"""
    <.button overrideclass={@overrideclass} {@rest}>
      {render_slot(@inner_block)}
      <span class="dock-label">{@label}</span>
    </.button>
    """
  end

  @doc """
  Drawer is a grid layout that can show/hide a sidebar on the left or right side of the page.
  https://daisyui.com/components/drawer/
  """
  @drawer_placements %{
    "end" => "drawer-end"
  }
  attr(:placement, :string,
    values: Map.keys(@drawer_placements),
    doc: "the placement of the drawer"
  )

  attr(:open, :boolean, default: false, doc: "whether the drawer is open by default")

  attr(:toggleid, :string,
    default: "drawer_toggle",
    doc: "the id of the checkbox input controlling the drawer"
  )

  attr(:tag, :string, default: "div")
  attr(:class, :any, default: nil)
  attr(:overrideclass, :any)
  attr(:rest, :global)

  slot(:inner_block)

  slot :side do
    attr(:close_label, :string)
    attr(:tag, :any)
    attr(:class, :any)
  end

  slot :content do
    attr(:tag, :any)
    attr(:class, :any)
  end

  def drawer(assigns) do
    assigns =
      assigns
      |> assign(:baseclass, [
        "drawer",
        fetch_value!(@drawer_placements, assigns[:placement]),
        assigns[:open] && "drawer-open"
      ])
      |> merge_assigns(:rest, [:tag, :baseclass, :class, :overrideclass])

    ~H"""
    <.basic_tag {@rest}>
      <input id={@toggleid} type="checkbox" class="drawer-toggle" checked={@open} />
      <div :if={@content == []} class="drawer-content">{render_slot(@inner_block)}</div>
      <.basic_tag
        :for={content <- @content} baseclass="drawer-content" {assigns_to_attributes(content)}
      >{render_slot(content)}</.basic_tag>
      <.basic_tag :for={side <- @side} baseclass="drawer-side" {assigns_to_attributes(side, [:close_label])}>
        <label for={@toggleid} aria-label={side[:close_label]} class="drawer-overlay" />
        {render_slot(side)}
      </.basic_tag>
    </.basic_tag>
    """
  end

  @doc """
  Renders a dropdown component.
  https://daisyui.com/components/dropdown/

  ## Examples

      <.dropdown horizontal="center" vertical="bottom">
        <:toggle>
          Toggle Dropdown
        </:toggle>
        <.menu>
          <.:item>Item 1</.:item>
          <.:item>Item 2</.:item>
        </.menu>
      </.dropdown>

  """
  @dropdown_horizontals %{
    "left" => "dropdown-left",
    "center" => "dropdown-center",
    "right" => "dropdown-right"
  }
  @dropdown_verticals %{
    "top" => "dropdown-top",
    "middle" => "dropdown-middle",
    "bottom" => "dropdown-bottom"
  }
  attr(:open, :boolean, default: false)

  attr(:horizontal, :string,
    values: Map.keys(@dropdown_horizontals),
    doc: "the horizontal alignment of the dropdown"
  )

  attr(:vertical, :string,
    values: Map.keys(@dropdown_verticals),
    doc: "the vertical alignment of the dropdown"
  )

  attr(:tag, :string, default: "div")
  attr(:class, :any, default: nil)
  attr(:overrideclass, :any)
  attr(:rest, :global)
  slot(:inner_block, required: true)

  slot :toggle, required: true do
    attr(:class, :any)
    attr(:size, :string)
  end

  def dropdown(assigns) do
    baseclass = [
      "dropdown",
      assigns[:open] && assigns[:tag] != "details" && "dropdown-open",
      fetch_value!(@dropdown_horizontals, assigns[:horizontal]),
      fetch_value!(@dropdown_verticals, assigns[:vertical])
    ]

    if assigns[:tag] == "details" do
      assigns = assign_override(assigns, baseclass)

      ~H"""
      <details class={@overrideclass} open={@open} {@rest}>
        <summary
          :for={toggle <- @toggle} {assigns_to_attributes(toggle)}
        >{render_slot(toggle)}</summary>
        <div class="dropdown-content">{render_slot(@inner_block)}</div>
      </details>
      """
    else
      assigns =
        assigns
        |> assign(:baseclass, baseclass)
        |> merge_assigns(:rest, [:tag, :baseclass, :class, :overrideclass])

      ~H"""
      <.basic_tag {@rest}>
        <.button
          :for={toggle <- @toggle} tag="div" tabindex="0" {assigns_to_attributes(toggle)}
        >{render_slot(toggle)}</.button>
        <div tabindex="-1" class="dropdown-content">{render_slot(@inner_block)}</div>
      </.basic_tag>
      """
    end
  end

  @doc """
  Renders a fieldset with optional legend and label.
  https://daisyui.com/components/fieldset/

  ## Examples

      <.fieldset>
        <:legend>Personal Information</:legend>
        <.input field={@form[:name]} label="Name" />
      </.fieldset>

  """
  attr(:tag, :string, default: "fieldset")
  attr(:class, :any, default: nil)
  attr(:overrideclass, :any)
  attr(:rest, :global, doc: "the arbitrary HTML attributes to add to the fieldset")
  slot(:inner_block, required: true)

  slot :legend do
    attr(:tag, :string)
    attr(:class, :any)
  end

  slot :label do
    attr(:tag, :string)
    attr(:class, :any)
  end

  def fieldset(assigns) do
    assigns = merge_assigns(assigns, :rest, [:tag, :class, :overrideclass])

    ~H"""
    <.basic_tag baseclass="fieldset" {@rest}>
      <.basic_tag
        :for={legend <- @legend} baseclass="fieldset-legend" tag={legend[:tag] || "legend"} {assigns_to_attributes(legend, [:tag])}
      >{render_slot(legend)}</.basic_tag>
      {render_slot(@inner_block)}
      <.basic_tag
        :for={label <- @label} baseclass="label" tag={label[:tag] || "p"} {assigns_to_attributes(label, [:tag])}
      >{render_slot(label)}</.basic_tag>
    </.basic_tag>
    """
  end

  @doc """
  Renders a hover 3D effect wrapper.
  https://daisyui.com/components/hover-3d/

  ## Examples

      <.hover_3d class="w-32 h-32 bg-base-200 rounded-box flex items-center justify-center">
        Hover Me
      </.hover_3d>

  """
  attr(:tag, :string, default: "div")
  attr(:class, :any, default: nil)
  attr(:overrideclass, :any)
  attr(:rest, :global)
  slot(:inner_block, required: true)

  def hover_3d(assigns) do
    assigns = merge_assigns(assigns, :rest, [:tag, :class, :overrideclass])

    ~H"""
    <.basic_tag baseclass="hover-3d" {@rest}>
      {render_slot(@inner_block)}
      <div :for={_ <- 0..8} />
    </.basic_tag>
    """
  end

  @doc """
  Hero is a component for displaying a large box or image with a title and description.
  https://daisyui.com/components/hero/
  """
  attr(:tag, :string, default: "div")
  attr(:class, :any, default: nil)
  attr(:overrideclass, :any)
  attr(:rest, :global)

  slot(:inner_block)

  slot :content do
    attr(:class, :any)
  end

  slot :overlay do
    attr(:class, :any)
  end

  def hero(assigns) do
    assigns = merge_assigns(assigns, :rest, [:tag, :class, :overrideclass])

    ~H"""
    <.basic_tag baseclass="hero" {@rest}>
      <.basic_tag :for={overlay <- @overlay} baseclass="hero-overlay" {assigns_to_attributes(overlay)} />
      <div :if={@content == []} class="hero-content">{render_slot(@inner_block)}</div>
      <.basic_tag
        :for={content <- @content} baseclass="hero-content" {assigns_to_attributes(content)}
      >{render_slot(content)}</.basic_tag>
    </.basic_tag>
    """
  end

  @doc """
  Renders an input field.
  https://daisyui.com/components/input/

  ## Examples

      <.input type="text" name="username" color="primary" size="md" />
      <.input type="password" name="password" color="error" size="lg" style="ghost" />

  """
  @input_colors %{
    "primary" => "input-primary",
    "secondary" => "input-secondary",
    "neutral" => "input-neutral",
    "accent" => "input-accent",
    "error" => "input-error",
    "warning" => "input-warning",
    "info" => "input-info",
    "success" => "input-success"
  }
  @input_sizes %{
    "xs" => "input-xs",
    "sm" => "input-sm",
    "md" => "input-md",
    "lg" => "input-lg",
    "xl" => "input-xl"
  }
  @input_styles %{
    "ghost" => "input-ghost"
  }
  attr(:color, :string,
    values: Map.keys(@input_colors),
    doc: "the color of the input"
  )

  attr(:size, :string,
    values: Map.keys(@input_sizes),
    doc: "the size of the input"
  )

  attr(:style, :string,
    values: Map.keys(@input_styles),
    doc: "the style of the input"
  )

  attr(:class, :any, default: nil)
  attr(:overrideclass, :any)

  attr(:rest, :global,
    include:
      ~w(accept autocomplete capture checked cols disabled form id list max maxlength min
                minlength multiple pattern placeholder readonly required rows size step type value)
  )

  def input(assigns) do
    assigns
    |> assign(:baseclass, [
      "input",
      fetch_value!(@input_colors, assigns[:color]),
      fetch_value!(@input_sizes, assigns[:size]),
      fetch_value!(@input_styles, assigns[:style])
    ])
    |> assign(:tag, "input")
    |> basic_tag()
  end

  @doc """
  Renders a label component.
  https://daisyui.com/components/label/

  ## Examples

      <.label for="username">Username</.label>
      <.label floating={true}>Email</.label>

  """
  attr(:floating, :boolean, default: false, doc: "whether to use floating label style")
  attr(:tag, :string, default: "label")
  attr(:class, :any, default: nil)
  attr(:overrideclass, :any)
  attr(:rest, :global)
  slot(:inner_block, required: true)

  def label(assigns) do
    baseclass = if assigns[:floating], do: "floating-label", else: "label"

    assigns
    |> assign(:baseclass, baseclass)
    |> basic_tag()
  end

  @doc """
  Renders a loading indicator.
  https://daisyui.com/components/loading/

  ## Examples

      <.loading style="spinner" size="md" />
      <.loading style="dots" size="lg" />

  """
  @loading_styles %{
    "spinner" => "loading-spinner",
    "dots" => "loading-dots",
    "ring" => "loading-ring",
    "ball" => "loading-ball",
    "bars" => "loading-bars"
  }
  @loading_sizes %{
    "xs" => "loading-xs",
    "sm" => "loading-sm",
    "md" => "loading-md",
    "lg" => "loading-lg",
    "xl" => "loading-xl"
  }
  attr(:style, :string,
    values: Map.keys(@loading_styles),
    doc: "the style of the loading indicator"
  )

  attr(:size, :string,
    values: Map.keys(@loading_sizes),
    doc: "the size of the loading indicator"
  )

  attr(:tag, :string, default: "div")
  attr(:class, :any, default: nil)
  attr(:overrideclass, :any)
  attr(:rest, :global)

  def loading(assigns) do
    assigns
    |> assign(:baseclass, [
      "loading",
      fetch_value!(@loading_styles, assigns[:style]),
      fetch_value!(@loading_sizes, assigns[:size])
    ])
    |> basic_tag()
  end

  @doc """
  Renders a menu component.
  https://daisyui.com/components/menu/

  ## Examples

      <.menu size="md" direction="vertical">
        <:item title="Home" />
        <:item title="About" />
        <:item title="Contact" />
      </.menu>

  """
  @menu_sizes %{
    "xs" => "menu-xs",
    "sm" => "menu-sm",
    "md" => "menu-md",
    "lg" => "menu-lg",
    "xl" => "menu-xl"
  }
  @menu_directions %{
    "horizontal" => "menu-horizontal",
    "vertical" => "menu-vertical"
  }
  attr(:size, :string,
    values: Map.keys(@menu_sizes),
    doc: "the size of the menu"
  )

  attr(:direction, :string,
    values: Map.keys(@menu_directions),
    doc: "the direction of the menu"
  )

  attr(:tag, :string, default: "ul", values: ["ul", "ol"])
  attr(:class, :any, default: nil)
  attr(:overrideclass, :any)
  attr(:rest, :global)

  slot :item, required: true do
    attr(:title, :string)
    attr(:disabled, :boolean)
    attr(:class, :any)
  end

  def menu(assigns) do
    assigns =
      assigns
      |> assign(:baseclass, [
        "menu",
        fetch_value!(@menu_sizes, assigns[:size]),
        fetch_value!(@menu_directions, assigns[:direction])
      ])
      |> merge_assigns(:rest, [:tag, :baseclass, :class, :overrideclass])

    ~H"""
    <.basic_tag {@rest}>
      <.menu_item
        :for={item <- @item} {assigns_to_attributes(item)}
      >{render_slot(item)}</.menu_item>
    </.basic_tag>
    """
  end

  attr(:disabled, :boolean, default: false)
  attr(:title, :string, default: nil)
  attr(:class, :any, default: nil)
  attr(:overrideclass, :any)
  attr(:rest, :global)
  slot(:inner_block)

  def menu_item(assigns) do
    assigns =
      assigns
      |> assign(:baseclass, [
        assigns[:disabled] && "menu-disabled",
        assigns[:title] && "menu-title"
      ])
      |> merge_assigns(:rest, [:baseclass, :class, :overrideclass])

    ~H"""
    <.basic_tag tag="li" {@rest}>{@title || render_slot(@inner_block)}</.basic_tag>
    """
  end

  @doc """
  Modal is used to show a dialog or a box when you click a button.
  https://daisyui.com/components/modal/

  ## Examples

      <.modal vertical="middle" horizontal="end" open={true}>
        <h3 class="font-bold text-lg">Congratulations!</h3>
        <p class="py-4">You've been selected for a chance to get one year of subscription to our service for free!</p>
        <:action>
          <.button>Yay!</.button>
        </:action>
      </.modal>

  """
  @modal_verticals %{
    "bottom" => "modal-bottom",
    "middle" => "modal-middle",
    "top" => "modal-top"
  }
  @modal_horizontals %{
    "start" => "modal-start",
    "end" => "modal-end"
  }
  attr(:vertical, :string,
    values: Map.keys(@modal_verticals),
    doc: "the vertical alignment of the modal"
  )

  attr(:horizontal, :string,
    values: Map.keys(@modal_horizontals),
    doc: "the horizontal alignment of the modal"
  )

  attr(:open, :boolean, default: false, doc: "whether the modal is open")
  attr(:tag, :string, default: "div")
  attr(:class, :any, default: nil)
  attr(:overrideclass, :any)
  attr(:rest, :global)

  slot(:inner_block)

  slot :box do
    attr(:tag, :any)
    attr(:class, :any)
  end

  slot :action do
    attr(:tag, :any)
    attr(:class, :any)
  end

  slot :backdrop do
    attr(:tag, :any)
    attr(:class, :any)
  end

  def modal(assigns) do
    assigns =
      assigns
      |> assign(:baseclass, [
        "modal",
        fetch_value!(@modal_verticals, assigns[:vertical]),
        fetch_value!(@modal_horizontals, assigns[:horizontal]),
        assigns[:open] && assigns[:tag] != "dialog" && "modal-open"
      ])
      |> merge_assigns(:rest, [:tag, :baseclass, :class, :overrideclass])

    assigns =
      if assigns[:tag] == "dialog" do
        merge_assigns(assigns, :rest, [:open])
      else
        update(assigns, :rest, &Map.put(&1, :role, "dialog"))
      end

    ~H"""
    <.basic_tag {@rest}>
      <.basic_tag :for={box <- if(@box != [], do: @box, else: [@inner_block])} baseclass="modal-box" {assigns_to_attributes(box)}>
        {render_slot(box)}
        <.basic_tag
          :for={action <- @action} baseclass="modal-action" {assigns_to_attributes(action)}
        >{render_slot(action)}</.basic_tag>
      </.basic_tag>
      <.basic_tag :for={backdrop <- @backdrop} baseclass="modal-backdrop" {assigns_to_attributes(backdrop)} />
    </.basic_tag>
    """
  end

  @doc """
  Renders a progress bar component.
  https://daisyui.com/components/progress/

  ## Examples

      <.progress value={40} max={100} color="primary" />

  """
  @progress_colors %{
    "neutral" => "progress-neutral",
    "primary" => "progress-primary",
    "secondary" => "progress-secondary",
    "accent" => "progress-accent",
    "info" => "progress-info",
    "success" => "progress-success",
    "warning" => "progress-warning",
    "error" => "progress-error"
  }
  attr(:color, :string,
    values: Map.keys(@progress_colors),
    doc: "the color of the progress bar"
  )

  attr(:class, :any, default: nil)
  attr(:overrideclass, :any)
  attr(:rest, :global, include: ~w(value max))

  def progress(assigns) do
    assigns
    |> assign(:baseclass, [
      "progress",
      fetch_value!(@progress_colors, assigns[:color])
    ])
    |> assign(:tag, "progress")
    |> merge_assigns(:rest, [:value, :max])
    |> basic_tag()
  end

  @doc """
  Renders a radio input component.
  https://daisyui.com/components/radio/

  ## Examples

      <.radio color="primary" size="md" />

  """
  @radio_colors %{
    "primary" => "radio-primary",
    "secondary" => "radio-secondary",
    "neutral" => "radio-neutral",
    "accent" => "radio-accent",
    "error" => "radio-error",
    "warning" => "radio-warning",
    "info" => "radio-info",
    "success" => "radio-success"
  }
  @radio_sizes %{
    "xs" => "radio-xs",
    "sm" => "radio-sm",
    "md" => "radio-md",
    "lg" => "radio-lg",
    "xl" => "radio-xl"
  }
  @radio_styles %{
    "ghost" => "radio-ghost"
  }
  attr(:color, :string,
    values: Map.keys(@radio_colors),
    doc: "the color of the radio input"
  )

  attr(:size, :string,
    values: Map.keys(@radio_sizes),
    doc: "the size of the radio input"
  )

  attr(:style, :string,
    values: Map.keys(@radio_styles),
    doc: "the style of the radio input"
  )

  attr(:type, :string, default: "radio")
  attr(:class, :any, default: nil)
  attr(:overrideclass, :any)

  attr(:rest, :global,
    include:
      ~w(accept autocomplete capture checked cols disabled form id list max maxlength min
                minlength multiple pattern placeholder readonly required rows size step value name)
  )

  def radio(assigns) do
    assigns
    |> assign(:baseclass, [
      "radio",
      fetch_value!(@radio_colors, assigns[:color]),
      fetch_value!(@radio_sizes, assigns[:size]),
      fetch_value!(@radio_styles, assigns[:style])
    ])
    |> assign(:tag, "input")
    |> merge_assigns(:rest, [:type])
    |> basic_tag()
  end

  @doc """
  Renders a range input component.
  https://daisyui.com/components/range/

  ## Examples

      <.range color="primary" size="md" />

  """
  @range_colors %{
    "primary" => "range-primary",
    "secondary" => "range-secondary",
    "neutral" => "range-neutral",
    "accent" => "range-accent",
    "error" => "range-error",
    "warning" => "range-warning",
    "info" => "range-info",
    "success" => "range-success"
  }
  @range_sizes %{
    "xs" => "range-xs",
    "sm" => "range-sm",
    "md" => "range-md",
    "lg" => "range-lg",
    "xl" => "range-xl"
  }
  attr(:color, :string,
    values: Map.keys(@range_colors),
    doc: "the color of the range input"
  )

  attr(:size, :string,
    values: Map.keys(@range_sizes),
    doc: "the size of the range input"
  )

  attr(:type, :string, default: "range")
  attr(:class, :any, default: nil)
  attr(:overrideclass, :any)

  attr(:rest, :global,
    include: ~w(accept autocomplete capture checked cols disabled form id list max maxlength min
                minlength multiple pattern placeholder readonly required rows size step value)
  )

  def range(assigns) do
    assigns
    |> assign(:baseclass, [
      "range",
      fetch_value!(@range_colors, assigns[:color]),
      fetch_value!(@range_sizes, assigns[:size])
    ])
    |> assign(:tag, "input")
    |> merge_assigns(:rest, [:type])
    |> basic_tag()
  end

  @doc """
  Renders a styled select input.
  https://daisyui.com/components/select/

  ## Examples

      <.select name="my-select" options={[{"One", 1}, {"Two", 2}]} value={1} class="my-class">
        <:option value={1} selected>One</:option>
        <:option value={2}>Two</:option>
      </.select>

      <.select
        name="my-select"
        value={2}
        color="primary"
        size="lg"
        style="ghost"
      >
        <:option value={1}>One</:option>
        <:option value={2} selected>Two</:option>
      </.select>

  """
  @select_colors %{
    "primary" => "select-primary",
    "secondary" => "select-secondary",
    "neutral" => "select-neutral",
    "accent" => "select-accent",
    "error" => "select-error",
    "warning" => "select-warning",
    "info" => "select-info",
    "success" => "select-success"
  }
  @select_sizes %{
    "xs" => "select-xs",
    "sm" => "select-sm",
    "md" => "select-md",
    "lg" => "select-lg",
    "xl" => "select-xl"
  }
  @select_styles %{
    "ghost" => "select-ghost"
  }
  attr(:color, :string, values: Map.keys(@select_colors))
  attr(:size, :string, values: Map.keys(@select_sizes))
  attr(:style, :string, values: Map.keys(@select_styles))
  attr(:class, :any, default: nil)
  attr(:overrideclass, :any)
  attr(:rest, :global, include: ~w(name value multiple))

  slot(:inner_block)

  slot :option do
    attr(:value, :any)
    attr(:selected, :boolean)
  end

  def select(assigns) do
    assigns =
      assigns
      |> assign(:baseclass, [
        "select",
        fetch_value!(@select_colors, assigns[:color]),
        fetch_value!(@select_sizes, assigns[:size]),
        fetch_value!(@select_styles, assigns[:style])
      ])
      |> merge_assigns(:rest, [:baseclass, :class, :overrideclass])

    ~H"""
    <.basic_tag tag="select" {@rest}>
      <option
        :for={option <- @option} {assigns_to_attributes(option)}
      >{render_slot(option)}</option>
      {render_slot(@inner_block)}
    </.basic_tag>
    """
  end

  @doc """
  Renders a stats component.
  https://daisyui.com/components/stats/

  ## Examples

      <.stats position="horizontal">
        <:stat title="Downloads" value="31K" desc="Jan 1st - Feb 1st" />
        <:stat title="New Users" value="4,200" desc="↗︎ 400 (22%)" />
        <:stat title="New Registers" value="1,200" desc="↘︎ 90 (14%)" />
      </.stats>

  """
  @stats_directions %{
    "vertical" => "stats-vertical",
    "horizontal" => "stats-horizontal"
  }
  attr(:direction, :string,
    values: Map.keys(@stats_directions),
    doc: "the direction of the stats"
  )

  attr(:tag, :string, default: "div")
  attr(:class, :any, default: nil)
  attr(:overrideclass, :any)
  attr(:rest, :global)

  slot(:inner_block)

  slot :stat do
    attr(:title, :string, required: true)
    attr(:value, :string)
    attr(:desc, :string)
    attr(:tag, :string)
    attr(:class, :any)
  end

  def stats(assigns) do
    assigns =
      assigns
      |> assign(:baseclass, [
        "stats",
        fetch_value!(@stats_directions, assigns[:direction])
      ])
      |> merge_assigns(:rest, [:tag, :baseclass, :class, :overrideclass])

    ~H"""
    <.basic_tag {@rest}>
      <.stat :for={stat <- @stat} {assigns_to_attributes(stat, [:title, :value, :desc])}>
        <:figure :if={stat[:value] != nil && stat[:inner_block] != nil}>{render_slot(stat)}</:figure>
        <:title>{stat[:title]}</:title>
        <:value>{stat[:value] || render_slot(stat)}</:value>
        <:desc :if={stat[:desc]}>{stat[:desc]}</:desc>
      </.stat>
      {render_slot(@inner_block)}
    </.basic_tag>
    """
  end

  attr(:tag, :string, default: "div")
  attr(:class, :any, default: nil)
  attr(:overrideclass, :any)
  attr(:rest, :global)

  slot :title, required: true do
    attr(:tag, :string)
    attr(:class, :any)
  end

  slot :value do
    attr(:tag, :string)
    attr(:class, :any)
  end

  slot :figure do
    attr(:tag, :string)
    attr(:class, :any)
  end

  slot :desc do
    attr(:tag, :string)
    attr(:class, :any)
  end

  def stat(assigns) do
    assigns =
      assigns
      |> assign(:baseclass, "stat")
      |> merge_assigns(:rest, [:tag, :baseclass, :class, :overrideclass])

    ~H"""
    <.basic_tag {@rest}>
      <.basic_tag
        :for={figure <- @figure} baseclass="stat-figure" {assigns_to_attributes(figure)}
      >{render_slot(figure)}</.basic_tag>
      <.basic_tag
        :for={title <- @title} baseclass="stat-title" {assigns_to_attributes(title)}
      >{render_slot(title)}</.basic_tag>
      <.basic_tag
        :for={value <- @value} baseclass="stat-value" {assigns_to_attributes(value)}
      >{render_slot(value)}</.basic_tag>
      <.basic_tag
        :for={desc <- @desc} baseclass="stat-desc" {assigns_to_attributes(desc)}
      >{render_slot(desc)}</.basic_tag>
    </.basic_tag>
    """
  end

  @doc """
  Renders a swap component.
  https://daisyui.com/components/swap/

  ## Examples

      <.swap active style="flip">
        <:on>
          <.icon name="hero-moon" class="size-6" />
        </:on>
        <:off>
          <.icon name="hero-sun" class="size-6" />
        </:off>
      </.swap>

  """
  @swap_styles %{
    "flip" => "swap-flip",
    "rotate" => "swap-rotate"
  }
  attr(:active, :boolean, default: false)
  attr(:style, :string, values: Map.keys(@swap_styles), doc: "the style of the swap")
  attr(:tag, :string, default: "span")
  attr(:class, :any, default: nil)
  attr(:overrideclass, :any)
  attr(:rest, :global)
  slot(:on, required: true)
  slot(:off, required: true)

  def swap(assigns) do
    assigns =
      assign(assigns, :baseclass, [
        "swap",
        assigns[:active] && "swap-active",
        fetch_value!(@swap_styles, assigns[:style])
      ])
      |> merge_assigns(:rest, [:tag, :baseclass, :class, :overrideclass])

    ~H"""
    <.basic_tag {@rest}>
      <.basic_tag
        :for={on <- @on} baseclass="swap-on" tag={on[:tag] || "span"} {assigns_to_attributes(on, [:tag])}
      >{render_slot(on)}</.basic_tag>
      <.basic_tag
        :for={off <- @off} baseclass="swap-off" tag={off[:tag] || "span"} {assigns_to_attributes(off, [:tag])}
      >{render_slot(off)}</.basic_tag>
    </.basic_tag>
    """
  end

  @doc """
  Renders a tabs component.
  https://daisyui.com/components/tabs/

  ## Examples

      <.tabs size="md" placement="top" style="border">
        <:tab active>
          Tab 1
        </:tab>
        <:tab>
          Tab 2
        </:tab>
        <:tab>
          Tab 3
        </:tab>
      </.tabs>

  """
  @tab_sizes %{
    "xs" => "tabs-xs",
    "sm" => "tabs-sm",
    "md" => "tabs-md",
    "lg" => "tabs-lg",
    "xl" => "tabs-xl"
  }
  @tab_placements %{
    "top" => "tabs-top",
    "bottom" => "tabs-bottom"
  }
  @tab_styles %{
    "border" => "tabs-border",
    "box" => "tabs-box",
    "lift" => "tabs-lift"
  }
  attr(:size, :string,
    values: Map.keys(@tab_sizes),
    doc: "the size of the tabs"
  )

  attr(:placement, :string,
    values: Map.keys(@tab_placements),
    doc: "the placement of the tabs"
  )

  attr(:style, :string,
    values: Map.keys(@tab_styles),
    doc: "the style of the tabs"
  )

  attr(:tag, :string, default: "div")
  attr(:class, :any, default: nil)
  attr(:overrideclass, :any)
  attr(:rest, :global)

  slot :tab, required: true do
    attr(:tag, :string)
    attr(:class, :any)
    attr(:active, :boolean)
    attr(:href, :any)
    attr(:patch, :any)
    attr(:navigate, :any)
  end

  def tabs(assigns) do
    assigns =
      assigns
      |> assign(:baseclass, [
        "tabs",
        fetch_value!(@tab_sizes, assigns[:size]),
        fetch_value!(@tab_placements, assigns[:placement]),
        fetch_value!(@tab_styles, assigns[:style])
      ])
      |> merge_assigns(:rest, [:tag, :baseclass, :class, :overrideclass])

    ~H"""
    <.basic_tag role="tablist" {@rest}>
      <.tab_item
        :for={tab <- @tab} {assigns_to_attributes(tab)}
      >{render_slot(tab)}</.tab_item>
    </.basic_tag>
    """
  end

  attr(:active, :boolean, default: false)
  attr(:tag, :string, default: "a")
  attr(:class, :any, default: nil)
  attr(:overrideclass, :any)
  attr(:rest, :global)
  slot(:inner_block, required: true)

  def tab_item(assigns) do
    baseclass = ["tab", assigns[:active] && "tab-active"]

    if assigns[:tag] == "a" do
      assigns = assign_override(assigns, baseclass)

      ~H"""
      <.link class={@overrideclass} {@rest}>{render_slot(@inner_block)}</.link>
      """
    else
      assign(assigns, :baseclass, baseclass) |> basic_tag()
    end
  end

  @doc """
  Renders a styled textarea input.
  https://daisyui.com/components/textarea/

  ## Examples

      <.textarea name="my-textarea" value="Hello!" class="my-class" />
      <.textarea name="my-textarea" value="Hello!" color="primary" size="lg" style="ghost" />

  """
  @textarea_colors %{
    "primary" => "textarea-primary",
    "secondary" => "textarea-secondary",
    "neutral" => "textarea-neutral",
    "accent" => "textarea-accent",
    "error" => "textarea-error",
    "warning" => "textarea-warning",
    "info" => "textarea-info",
    "success" => "textarea-success"
  }
  @textarea_sizes %{
    "xs" => "textarea-xs",
    "sm" => "textarea-sm",
    "md" => "textarea-md",
    "lg" => "textarea-lg",
    "xl" => "textarea-xl"
  }
  @textarea_styles %{
    "ghost" => "textarea-ghost"
  }
  attr(:value, :any, default: nil)
  attr(:color, :string, values: Map.keys(@textarea_colors))
  attr(:size, :string, values: Map.keys(@textarea_sizes))
  attr(:style, :string, values: Map.keys(@textarea_styles))
  attr(:class, :any, default: nil)
  attr(:overrideclass, :any)

  attr(:rest, :global,
    include:
      ~w(cols disabled form id maxlength minlength name placeholder readonly required rows size)
  )

  slot(:inner_block)

  def textarea(assigns) do
    assigns =
      assigns
      |> assign(:baseclass, [
        "textarea",
        fetch_value!(@textarea_colors, assigns[:color]),
        fetch_value!(@textarea_sizes, assigns[:size]),
        fetch_value!(@textarea_styles, assigns[:style])
      ])
      |> merge_assigns(:rest, [:baseclass, :class, :overrideclass])

    ~H"""
    <.basic_tag tag="textarea" {@rest}>{@value || render_slot(@inner_block)}</.basic_tag>
    """
  end

  @doc """
  Renders a toast container.
  https://daisyui.com/components/toast/

  ## Examples

      <.toast horizontal="end" vertical="top">
        <div class="alert alert-success">
          <div>
            <span>Operation successful!</span>
          </div>
        </div>
      </.toast>

  """
  @toast_horizontals %{
    "start" => "toast-start",
    "center" => "toast-center",
    "end" => "toast-end"
  }
  @toast_verticals %{
    "top" => "toast-top",
    "middle" => "toast-middle",
    "bottom" => "toast-bottom"
  }
  attr(:horizontal, :string,
    values: Map.keys(@toast_horizontals),
    doc: "the horizontal alignment of the toast"
  )

  attr(:vertical, :string,
    values: Map.keys(@toast_verticals),
    doc: "the vertical alignment of the toast"
  )

  attr(:tag, :string, default: "div")
  attr(:class, :any, default: nil)
  attr(:overrideclass, :any)
  attr(:rest, :global)
  slot(:inner_block, required: true)

  def toast(assigns) do
    assigns
    |> assign(:baseclass, [
      "toast",
      fetch_value!(@toast_horizontals, assigns[:horizontal]),
      fetch_value!(@toast_verticals, assigns[:vertical])
    ])
    |> basic_tag()
  end

  @doc """
  Renders a toggle input component.
  https://daisyui.com/components/toggle/

  ## Examples

      <.toggle color="primary" size="md" />

  """
  @toggle_colors %{
    "primary" => "toggle-primary",
    "secondary" => "toggle-secondary",
    "neutral" => "toggle-neutral",
    "accent" => "toggle-accent",
    "error" => "toggle-error",
    "warning" => "toggle-warning",
    "info" => "toggle-info",
    "success" => "toggle-success"
  }
  @toggle_sizes %{
    "xs" => "toggle-xs",
    "sm" => "toggle-sm",
    "md" => "toggle-md",
    "lg" => "toggle-lg",
    "xl" => "toggle-xl"
  }
  attr(:color, :string,
    values: Map.keys(@toggle_colors),
    doc: "the color of the toggle"
  )

  attr(:size, :string,
    values: Map.keys(@toggle_sizes),
    doc: "the size of the toggle"
  )

  attr(:class, :any, default: nil)
  attr(:overrideclass, :any)

  attr(:rest, :global,
    include:
      ~w(accept autocomplete capture checked cols disabled form id list max maxlength min
                minlength multiple pattern placeholder readonly required rows size step value name)
  )

  def toggle(assigns) do
    assigns
    |> assign(:baseclass, [
      "toggle",
      fetch_value!(@toggle_colors, assigns[:color]),
      fetch_value!(@toggle_sizes, assigns[:size])
    ])
    |> assign(:tag, "input")
    |> update(:rest, &Map.put(&1, :type, "checkbox"))
    |> basic_tag()
  end

  @doc """
  Renders a tooltip.
  https://daisyui.com/components/tooltip/

  ## Examples

      <.tooltip tip="This is a tooltip">
        <button class="btn">Hover me</button>
      </.tooltip>

      <.tooltip tip="Always visible tooltip" open color="info" orientation="right">
        <.icon name="hero-information-circle" class="size-5" />
      </.tooltip>

  """
  @tooltip_colors %{
    "neutral" => "tooltip-neutral",
    "primary" => "tooltip-primary",
    "secondary" => "tooltip-secondary",
    "accent" => "tooltip-accent",
    "info" => "tooltip-info",
    "success" => "tooltip-success",
    "warning" => "tooltip-warning",
    "error" => "tooltip-error"
  }
  @tooltip_placements %{
    "top" => "tooltip-top",
    "right" => "tooltip-right",
    "bottom" => "tooltip-bottom",
    "left" => "tooltip-left"
  }
  attr(:color, :string,
    values: Map.keys(@tooltip_colors),
    doc: "the color of the tooltip"
  )

  attr(:placement, :string,
    values: Map.keys(@tooltip_placements),
    doc: "the placement of the tooltip"
  )

  attr(:tip, :string, required: true)
  attr(:open, :boolean, default: false, doc: "whether the tooltip is open by default")
  attr(:tag, :string, default: "div")
  attr(:class, :any, default: nil)
  attr(:overrideclass, :any)
  attr(:rest, :global)

  slot(:inner_block, required: true)

  def tooltip(assigns) do
    assigns
    |> assign(:baseclass, [
      "tooltip",
      fetch_value!(@tooltip_colors, assigns[:color]),
      fetch_value!(@tooltip_placements, assigns[:placement]),
      assigns[:open] && "tooltip-open"
    ])
    |> update(:rest, &Map.put(&1, :"data-tip", assigns[:tip]))
    |> basic_tag()
  end

  # A utility component
  attr(:tag, :string, default: "div")
  attr(:class, :any, default: nil)
  attr(:baseclass, :any, default: nil)
  attr(:overrideclass, :any)
  attr(:rest, :global)
  slot(:inner_block)

  defp basic_tag(assigns) do
    assigns = assign_override(assigns, assigns[:baseclass])

    ~H"""
    <.dynamic_tag
      tag_name={@tag} class={@overrideclass} {@rest}
    >{render_slot(@inner_block)}</.dynamic_tag>
    """
  end

  defp assign_override(assigns, baseclass) when is_map(assigns) do
    assign_new(assigns, :overrideclass, fn ->
      List.wrap(baseclass) ++ List.wrap(assigns[:class])
    end)
  end

  defp fetch_value!(_map, nil), do: nil
  defp fetch_value!(map, key) when is_map(map), do: Map.fetch!(map, key)

  defp merge_assigns(assigns, attr, keys) do
    update(assigns, attr, fn rest, assigns ->
      Map.take(assigns, keys) |> Map.merge(rest)
    end)
  end
end
