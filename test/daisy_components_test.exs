defmodule DaisyComponentsTest do
  use ExUnit.Case
  doctest DaisyComponents

  import Phoenix.Component
  import Phoenix.LiveViewTest

  import DaisyComponents

  describe "alert" do
    test "color" do
      for color <- ~w(info success warning error) do
        assigns = %{color: color}

        assert result =
                 rendered_to_string(~H"""
                 <.alert color={@color}>Hello</.alert>
                 """)

        assert result =~ ~s(<div role="alert" class="alert alert-#{color}">)
        assert result =~ "Hello"
      end
    end

    test "style" do
      for style <- ~w(outline dash soft) do
        assigns = %{style: style}

        assert result =
                 rendered_to_string(~H"""
                 <.alert style={@style}>Hello</.alert>
                 """)

        assert result =~ ~s(<div role="alert" class="alert alert-#{style}">)
        assert result =~ "Hello"
      end
    end

    test "direction" do
      for direction <- ~w(horizontal vertical) do
        assigns = %{direction: direction}

        assert result =
                 rendered_to_string(~H"""
                 <.alert direction={@direction}>Hello</.alert>
                 """)

        assert result =~ ~s(<div role="alert" class="alert alert-#{direction}">)
        assert result =~ "Hello"
      end
    end

    test "tag" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.alert>Hello</.alert>
               """)

      assert result =~ ~s(<div role="alert" class="alert">)
      assert result =~ "Hello"

      assert result =
               rendered_to_string(~H"""
               <.alert tag="span">Hello</.alert>
               """)

      assert result =~ ~s(<span role="alert" class="alert">)
      assert result =~ "Hello"
    end

    test "class" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.alert class="custom-class">Hello</.alert>
               """)

      assert result =~ ~s(<div role="alert" class="alert custom-class">)
      assert result =~ "Hello"
    end

    test "overrideclass" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.alert overrideclass="override-class">Hello</.alert>
               """)

      assert result =~ ~s(<div role="alert" class="override-class">)
      assert result =~ "Hello"
    end
  end

  describe "avatar" do
    test "status" do
      for status <- ~w(online offline) do
        assigns = %{status: status}

        assert result =
                 rendered_to_string(~H"""
                 <.avatar status={@status}>
                   <img src="user_avatar.png" alt="User Avatar" />
                 </.avatar>
                 """)

        assert result =~ ~s(<div class="avatar avatar-#{status}">)
        assert result =~ ~s(<img src="user_avatar.png" alt="User Avatar">)
      end
    end

    test "placeholder" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.avatar placeholder>
                 <img src="user_avatar.png" alt="User Avatar" />
               </.avatar>
               """)

      assert result =~ ~s(<div class="avatar avatar-placeholder">)
      assert result =~ ~s(<img src="user_avatar.png" alt="User Avatar">)
    end

    test "tag" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.avatar>
                 <img src="user_avatar.png" alt="User Avatar" />
               </.avatar>
               """)

      assert result =~ ~s(<div class="avatar">)
      assert result =~ ~s(<img src="user_avatar.png" alt="User Avatar">)

      assert result =
               rendered_to_string(~H"""
               <.avatar tag="span">
                 <img src="user_avatar.png" alt="User Avatar" />
               </.avatar>
               """)

      assert result =~ ~s(<span class="avatar">)
      assert result =~ ~s(<img src="user_avatar.png" alt="User Avatar">)
    end

    test "class" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.avatar class="custom-class">
                 <img src="user_avatar.png" alt="User Avatar" />
               </.avatar>
               """)

      assert result =~ ~s(<div class="avatar custom-class">)
      assert result =~ ~s(<img src="user_avatar.png" alt="User Avatar">)
    end

    test "overrideclass" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.avatar overrideclass="override-class">
                 <img src="user_avatar.png" alt="User Avatar" />
               </.avatar>
               """)

      assert result =~ ~s(<div class="override-class">)
      assert result =~ ~s(<img src="user_avatar.png" alt="User Avatar">)
    end
  end

  describe "avatar_group" do
    test "tag" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.avatar_group>
                 User Content
               </.avatar_group>
               """)

      assert result =~ ~s(<div class="avatar-group">)
      assert result =~ ~s(User Content)

      assert result =
               rendered_to_string(~H"""
               <.avatar_group tag="section">
                 User Content
               </.avatar_group>
               """)

      assert result =~ ~s(<section class="avatar-group">)
      assert result =~ ~s(User Content)
    end

    test "class" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.avatar_group class="custom-class">
                 User Content
               </.avatar_group>
               """)

      assert result =~ ~s(<div class="avatar-group custom-class">)
      assert result =~ ~s(User Content)
    end

    test "overrideclass" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.avatar_group overrideclass="override-class">
                 User Content
               </.avatar_group>
               """)

      assert result =~ ~s(<div class="override-class">)
      assert result =~ ~s(User Content)
    end
  end

  describe "badge" do
    test "color" do
      for color <- ~w(primary secondary accent neutral info success warning error) do
        assigns = %{color: color}

        assert result =
                 rendered_to_string(~H"""
                 <.badge color={@color}>Hello</.badge>
                 """)

        assert result =~ ~s(<span class="badge badge-#{color}">)
        assert result =~ "Hello"
      end
    end

    test "size" do
      for size <- ~w(xs sm md lg xl) do
        assigns = %{size: size}

        assert result =
                 rendered_to_string(~H"""
                 <.badge size={@size}>Hello</.badge>
                 """)

        assert result =~ ~s(<span class="badge badge-#{size}">)
        assert result =~ "Hello"
      end
    end

    test "style" do
      for style <- ~w(soft outline dash ghost) do
        assigns = %{style: style}

        assert result =
                 rendered_to_string(~H"""
                 <.badge style={@style}>Hello</.badge>
                 """)

        assert result =~ ~s(<span class="badge badge-#{style}">)
        assert result =~ "Hello"
      end
    end

    test "tag" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.badge>Hello</.badge>
               """)

      assert result =~ ~s(<span class="badge">)
      assert result =~ "Hello"

      assert result =
               rendered_to_string(~H"""
               <.badge tag="div">Hello</.badge>
               """)

      assert result =~ ~s(<div class="badge">)
      assert result =~ "Hello"
    end

    test "class" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.badge class="custom-class">Hello</.badge>
               """)

      assert result =~ ~s(<span class="badge custom-class">)
      assert result =~ "Hello"
    end

    test "overrideclass" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.badge overrideclass="override-class">Hello</.badge>
               """)

      assert result =~ ~s(<span class="override-class">)
      assert result =~ "Hello"
    end
  end

  describe "button" do
    test "color" do
      for color <- ~w(primary secondary accent neutral info success warning error) do
        assigns = %{color: color}

        assert result =
                 rendered_to_string(~H"""
                 <.button color={@color}>Click Me</.button>
                 """)

        assert result =~ ~s(<button class="btn btn-#{color}">)
        assert result =~ "Click Me"
      end
    end

    test "size" do
      for size <- ~w(xs sm md lg xl) do
        assigns = %{size: size}

        assert result =
                 rendered_to_string(~H"""
                 <.button size={@size}>Click Me</.button>
                 """)

        assert result =~ ~s(<button class="btn btn-#{size}">)
        assert result =~ "Click Me"
      end
    end

    test "style" do
      for style <- ~w(outline dash soft ghost link) do
        assigns = %{style: style}

        assert result =
                 rendered_to_string(~H"""
                 <.button style={@style}>Click Me</.button>
                 """)

        assert result =~ ~s(<button class="btn btn-#{style}">)
        assert result =~ "Click Me"
      end
    end

    test "shape" do
      for shape <- ~w(square circle block wide) do
        assigns = %{shape: shape}

        assert result =
                 rendered_to_string(~H"""
                 <.button shape={@shape}>Click Me</.button>
                 """)

        assert result =~ ~s(<button class="btn btn-#{shape}">)
        assert result =~ "Click Me"
      end
    end

    test "tag" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.button>Click Me</.button>
               """)

      assert result =~ ~s(<button class="btn">)
      assert result =~ "Click Me"

      assert result =
               rendered_to_string(~H"""
               <.button tag="div">Click Me</.button>
               """)

      assert result =~ ~s(<div class="btn">)
      assert result =~ "Click Me"

      assert result =
               rendered_to_string(~H"""
               <.button tag="a">Click Me</.button>
               """)

      assert result =~ ~s(<a href="#" class="btn">)
      assert result =~ "Click Me"
    end

    test "href" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.button href="/home">Go Home</.button>
               """)

      assert result =~ ~s(<a href="/home" class="btn">)
      assert result =~ "Go Home"
    end

    test "navigate" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.button navigate="/dashboard">Dashboard</.button>
               """)

      assert result =~
               ~s(<a href="/dashboard" data-phx-link="redirect" data-phx-link-state="push" class="btn">)

      assert result =~ "Dashboard"
    end

    test "patch" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.button patch="/settings">Settings</.button>
               """)

      assert result =~
               ~s(<a href="/settings" data-phx-link="patch" data-phx-link-state="push" class="btn">)

      assert result =~ "Settings"
    end

    test "class" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.button class="custom-class">Click Me</.button>
               """)

      assert result =~ ~s(<button class="btn custom-class">)
      assert result =~ "Click Me"
    end

    test "overrideclass" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.button overrideclass="override-class">Click Me</.button>
               """)

      assert result =~ ~s(<button class="override-class">)
      assert result =~ "Click Me"
    end
  end

  describe "card" do
    test "size" do
      for size <- ~w(xs sm md lg xl) do
        assigns = %{size: size}

        assert result =
                 rendered_to_string(~H"""
                 <.card size={@size}>
                   <p>Card Content</p>
                 </.card>
                 """)

        assert result =~ ~s(<div class="card card-#{size}">)
        assert result =~ "<p>Card Content</p>"
      end
    end

    test "style" do
      for style <- ~w(dash border) do
        assigns = %{style: style}

        assert result =
                 rendered_to_string(~H"""
                 <.card style={@style}>
                   <p>Card Content</p>
                 </.card>
                 """)

        assert result =~ ~s(<div class="card card-#{style}">)
        assert result =~ "<p>Card Content</p>"
      end
    end

    test "mod" do
      for {mod, class} <- %{"image-full" => "image-full", "side" => "card-side"} do
        assigns = %{mod: mod}

        assert result =
                 rendered_to_string(~H"""
                 <.card mod={@mod}>
                   <p>Card Content</p>
                 </.card>
                 """)

        assert result =~ ~s(<div class="card #{class}">)
        assert result =~ "<p>Card Content</p>"
      end
    end

    test "tag" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.card>
                 <p>Card Content</p>
               </.card>
               """)

      assert result =~ ~s(<div class="card">)
      assert result =~ "<p>Card Content</p>"

      assert result =
               rendered_to_string(~H"""
               <.card tag="section">
                 <p>Card Content</p>
               </.card>
               """)

      assert result =~ ~s(<section class="card">)
      assert result =~ "<p>Card Content</p>"
    end

    test "class" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.card class="custom-class">
                 <p>Card Content</p>
               </.card>
               """)

      assert result =~ ~s(<div class="card custom-class">)
      assert result =~ "<p>Card Content</p>"
    end

    test "overrideclass" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.card overrideclass="override-class">
                 <p>Card Content</p>
               </.card>
               """)

      assert result =~ ~s(<div class="override-class">)
      assert result =~ "<p>Card Content</p>"
    end

    test "title slot" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.card>
                 <:title>Card Title</:title>
                 <p>Card Content</p>
               </.card>
               """)

      assert result =~ ~s(<h2 class="card-title">)
      assert result =~ "Card Title"
      assert result =~ "<p>Card Content</p>"

      assert result =
               rendered_to_string(~H"""
               <.card>
                 <:title tag="div">Card Title</:title>
                 <p>Card Content</p>
               </.card>
               """)

      assert result =~ ~s(<div class="card-title">)
      assert result =~ "Card Title"
      assert result =~ "<p>Card Content</p>"

      assert result =
               rendered_to_string(~H"""
               <.card>
                 <:title class="custom-class">Card Title</:title>
                 <p>Card Content</p>
               </.card>
               """)

      assert result =~ ~s(<h2 class="card-title custom-class">)
      assert result =~ "Card Title"
      assert result =~ "<p>Card Content</p>"
    end

    test "actions slot" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.card>
                 <:actions><button>Card Action</button></:actions>
                 <p>Card Content</p>
               </.card>
               """)

      assert result =~ ~s(<div class="card-actions">)
      assert result =~ "Card Action"
      assert result =~ "<p>Card Content</p>"

      assert result =
               rendered_to_string(~H"""
               <.card>
                 <:actions tag="span"><button>Card Action</button></:actions>
                 <p>Card Content</p>
               </.card>
               """)

      assert result =~ ~s(<span class="card-actions">)
      assert result =~ "Card Action"
      assert result =~ "<p>Card Content</p>"

      assert result =
               rendered_to_string(~H"""
               <.card>
                 <:actions class="custom-class"><button>Card Action</button></:actions>
                 <p>Card Content</p>
               </.card>
               """)

      assert result =~ ~s(<div class="card-actions custom-class">)
      assert result =~ "<button>Card Action</button>"
      assert result =~ "<p>Card Content</p>"
    end

    test "image slot" do
      for placement <- ~w(top bottom) do
        assigns = %{placement: placement}

        assert result =
                 rendered_to_string(~H"""
                 <.card>
                   <:image placement={@placement} class="custom-class"><img src="image.jpg"/></:image>
                   <p>Card Content</p>
                 </.card>
                 """)

        assert result =~ ~s(<figure class="custom-class"><img src="image.jpg"></figure>)
        assert result =~ "<p>Card Content</p>"
      end
    end
  end

  describe "checkbox" do
    test "color" do
      for color <- ~w(primary secondary accent neutral info success warning error) do
        assigns = %{color: color}

        assert result =
                 rendered_to_string(~H"""
                 <.checkbox color={@color} />
                 """)

        assert result =~ ~s(<input type="checkbox" class="checkbox checkbox-#{color}">)
      end
    end

    test "size" do
      for size <- ~w(xs sm md lg xl) do
        assigns = %{size: size}

        assert result =
                 rendered_to_string(~H"""
                 <.checkbox size={@size} />
                 """)

        assert result =~ ~s(<input type="checkbox" class="checkbox checkbox-#{size}">)
      end
    end

    test "style" do
      for style <- ~w(ghost) do
        assigns = %{style: style}

        assert result =
                 rendered_to_string(~H"""
                 <.checkbox style={@style} />
                 """)

        assert result =~ ~s(<input type="checkbox" class="checkbox checkbox-#{style}">)
      end
    end

    test "class" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.checkbox class="custom-class" />
               """)

      assert result =~ ~s(<input type="checkbox" class="checkbox custom-class">)
    end

    test "overrideclass" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.checkbox overrideclass="override-class" />
               """)

      assert result =~ ~s(<input type="checkbox" class="override-class">)
    end
  end

  describe "collapse" do
    test "open" do
      for open <- [true, false] do
        assigns = %{open: open}

        assert result =
                 rendered_to_string(~H"""
                 <.collapse open={@open}>
                   <:title>Click to Expand</:title>
                   <p>Collapse Content</p>
                 </.collapse>
                 """)

        if open do
          assert result =~ ~s(<div class="collapse collapse-open">)
        else
          assert result =~ ~s(<div class="collapse">)
        end

        assert result =~ "<p>Collapse Content</p>"
      end
    end

    test "icon" do
      for icon <- ~w(arrow plus) do
        assigns = %{icon: icon}

        assert result =
                 rendered_to_string(~H"""
                 <.collapse icon={@icon}>
                   <:title>Click to Expand</:title>
                   <p>Collapse Content</p>
                 </.collapse>
                 """)

        assert result =~ ~s(<div class="collapse collapse-#{icon}">)
        assert result =~ "<p>Collapse Content</p>"
      end
    end

    test "tag" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.collapse>
                 <:title>Click to Expand</:title>
                 <p>Collapse Content</p>
               </.collapse>
               """)

      assert result =~ ~s(<div class="collapse">)
      assert result =~ "<p>Collapse Content</p>"

      assert result =
               rendered_to_string(~H"""
               <.collapse tag="section">
                 <:title>Click to Expand</:title>
                 <p>Collapse Content</p>
               </.collapse>
               """)

      assert result =~ ~s(<section class="collapse">)
      assert result =~ "<p>Collapse Content</p>"
    end

    test "class" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.collapse class="custom-class">
                 <:title>Click to Expand</:title>
                 <p>Collapse Content</p>
               </.collapse>
               """)

      assert result =~ ~s(<div class="collapse custom-class">)
      assert result =~ "<p>Collapse Content</p>"
    end

    test "overrideclass" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.collapse overrideclass="override-class">
                 <:title>Click to Expand</:title>
                 <p>Collapse Content</p>
               </.collapse>
               """)

      assert result =~ ~s(<div class="override-class">)
      assert result =~ "<p>Collapse Content</p>"
    end

    test "title slot" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.collapse>
                 <:title tag="h3" class="custom-title-class">Click to Expand</:title>
                 <p>Collapse Content</p>
               </.collapse>
               """)

      assert result =~ ~s(<h3 class="collapse-title custom-title-class">)
      assert result =~ "Click to Expand"
      assert result =~ "<p>Collapse Content</p>"
    end

    test "content slot" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.collapse>
                 <:title>Click to Expand</:title>
                 <:content tag="section" class="custom-content-class">
                   <p>Collapse Content</p>
                 </:content>
               </.collapse>
               """)

      assert result =~ ~s(<section class="collapse-content custom-content-class">)
      assert result =~ "<p>Collapse Content</p>"
    end
  end

  describe "countdown" do
    test "value" do
      for value <- [1, 12, 123] do
        assigns = %{value: value}

        assert result =
                 rendered_to_string(~H"""
                 <.countdown value={@value} />
                 """)

        assert result =~ ~s(<span class="countdown">)

        assert result =~
                 ~s(<span aria-live="polite" aria-label="#{value}" style="--value:#{value};--digits:1">#{value}</span>)
      end
    end

    test "digits" do
      for digits <- [1, 2, 3, 4] do
        assigns = %{digits: digits}

        assert result =
                 rendered_to_string(~H"""
                 <.countdown value={5} digits={@digits} />
                 """)

        assert result =~ ~s(<span class="countdown">)

        assert result =~
                 ~s(<span aria-live="polite" aria-label="5" style="--value:5;--digits:#{digits}">5</span>)
      end
    end

    test "tag" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.countdown value={10} />
               """)

      assert result =~ ~s(<span class="countdown">)

      assert result =
               rendered_to_string(~H"""
               <.countdown value={10} tag="div" />
               """)

      assert result =~ ~s(<div class="countdown">)
    end

    test "class" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.countdown value={10} class="custom-class" />
               """)

      assert result =~ ~s(<span class="countdown custom-class">)
    end

    test "overrideclass" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.countdown value={10} overrideclass="override-class" />
               """)

      assert result =~ ~s(<span class="override-class">)
    end
  end

  describe "divider" do
    test "color" do
      for color <- ~w(primary secondary accent neutral info success warning error) do
        assigns = %{color: color}

        assert result =
                 rendered_to_string(~H"""
                 <.divider color={@color} />
                 """)

        assert result =~ ~s(<div class="divider divider-#{color}">)
      end
    end

    test "direction" do
      for direction <- ~w(horizontal vertical) do
        assigns = %{direction: direction}

        assert result =
                 rendered_to_string(~H"""
                 <.divider direction={@direction} />
                 """)

        assert result =~ ~s(<div class="divider divider-#{direction}">)
      end
    end

    test "placement" do
      for placement <- ~w(start end) do
        assigns = %{placement: placement}

        assert result =
                 rendered_to_string(~H"""
                 <.divider placement={@placement} />
                 """)

        assert result =~ ~s(<div class="divider divider-#{placement}">)
      end
    end

    test "tag" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.divider />
               """)

      assert result =~ ~s(<div class="divider">)

      assert result =
               rendered_to_string(~H"""
               <.divider tag="span" />
               """)

      assert result =~ ~s(<span class="divider">)
    end

    test "class" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.divider class="custom-class" />
               """)

      assert result =~ ~s(<div class="divider custom-class">)
    end

    test "overrideclass" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.divider overrideclass="override-class" />
               """)

      assert result =~ ~s(<div class="override-class">)
    end
  end

  describe "dock" do
    test "size" do
      for size <- ~w(xs sm md lg xl) do
        assigns = %{size: size}

        assert result =
                 rendered_to_string(~H"""
                 <.dock size={@size}>
                   <:button label="Dock Button"><img src="icon.svg" /></:button>
                 </.dock>
                 """)

        assert result =~ ~s(<div class="dock dock-#{size}">)
        assert result =~ ~s(<img src="icon.svg">)
        assert result =~ ~s(<span class="dock-label">Dock Button</span>)
      end
    end

    test "tag" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.dock>
                 <:button label="Dock Button"><img src="icon.svg" /></:button>
               </.dock>
               """)

      assert result =~ ~s(<div class="dock">)
      assert result =~ ~s(<img src="icon.svg">)
      assert result =~ ~s(<span class="dock-label">Dock Button</span>)

      assert result =
               rendered_to_string(~H"""
               <.dock tag="section">
                 <:button label="Dock Button"><img src="icon.svg" /></:button>
               </.dock>
               """)

      assert result =~ ~s(<section class="dock">)
      assert result =~ ~s(<img src="icon.svg">)
      assert result =~ ~s(<span class="dock-label">Dock Button</span>)
    end

    test "class" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.dock class="custom-class">
                 <:button label="Dock Button"><img src="icon.svg" /></:button>
               </.dock>
               """)

      assert result =~ ~s(<div class="dock custom-class">)
      assert result =~ ~s(<img src="icon.svg">)
      assert result =~ ~s(<span class="dock-label">Dock Button</span>)
    end

    test "overrideclass" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.dock overrideclass="override-class">
                 <:button label="Dock Button"><img src="icon.svg" /></:button>
               </.dock>
               """)

      assert result =~ ~s(<div class="override-class">)
      assert result =~ ~s(<img src="icon.svg">)
      assert result =~ ~s(<span class="dock-label">Dock Button</span>)
    end

    test "button slot" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.dock>
                 <:button tag="a" href="/home" label="Home" active>
                   <img src="home.svg" />
                 </:button>
               </.dock>
               """)

      assert result =~ ~s(<a href="/home" class="dock-active">)
      assert result =~ ~s(<img src="home.svg">)
      assert result =~ ~s(<span class="dock-label">Home</span>)
    end
  end

  describe "drawer" do
    test "placement" do
      for placement <- ~w(end) do
        assigns = %{placement: placement}

        assert result =
                 rendered_to_string(~H"""
                 <.drawer placement={@placement}>
                   <p>Drawer Content</p>
                   <:side>Side Content</:side>
                 </.drawer>
                 """)

        assert result =~ ~s(<div class="drawer drawer-#{placement}">)
        assert result =~ "<p>Drawer Content</p>"
      end
    end

    test "open" do
      for open <- [true, false] do
        assigns = %{open: open}

        assert result =
                 rendered_to_string(~H"""
                 <.drawer open={@open}>
                   <p>Drawer Content</p>
                   <:side>Side Content</:side>
                 </.drawer>
                 """)

        if open do
          assert result =~ ~s(<div class="drawer drawer-open">)

          assert result =~
                   ~s(<input id="drawer_toggle" type="checkbox" class="drawer-toggle" checked>)
        else
          assert result =~ ~s(<div class="drawer">)
          assert result =~ ~s(<input id="drawer_toggle" type="checkbox" class="drawer-toggle">)
        end

        assert result =~ "<p>Drawer Content</p>"
      end
    end

    test "toggleid" do
      assigns = %{toggleid: "my_drawer_toggle"}

      assert result =
               rendered_to_string(~H"""
               <.drawer toggleid={@toggleid}>
                 <p>Drawer Content</p>
                 <:side>Side Content</:side>
               </.drawer>
               """)

      assert result =~ ~s(<input id="my_drawer_toggle" type="checkbox" class="drawer-toggle">)
      assert result =~ ~s(<label for="my_drawer_toggle" class="drawer-overlay">)
    end

    test "tag" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.drawer>
                 <p>Drawer Content</p>
                 <:side>Side Content</:side>
               </.drawer>
               """)

      assert result =~ ~s(<div class="drawer">)
      assert result =~ "<p>Drawer Content</p>"

      assert result =
               rendered_to_string(~H"""
               <.drawer tag="section">
                 <p>Drawer Content</p>
                 <:side>Side Content</:side>
               </.drawer>
               """)

      assert result =~ ~s(<section class="drawer">)
      assert result =~ "<p>Drawer Content</p>"
    end

    test "class" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.drawer class="custom-class">
                 <p>Drawer Content</p>
                 <:side>Side Content</:side>
               </.drawer>
               """)

      assert result =~ ~s(<div class="drawer custom-class">)
      assert result =~ "<p>Drawer Content</p>"
    end

    test "overrideclass" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.drawer overrideclass="override-class">
                 <p>Drawer Content</p>
                 <:side>Side Content</:side>
               </.drawer>
               """)

      assert result =~ ~s(<div class="override-class">)
      assert result =~ "<p>Drawer Content</p>"
    end
  end

  describe "dropdown" do
    test "open (non-details tag)" do
      for open <- [true, false] do
        assigns = %{open: open}

        assert result =
                 rendered_to_string(~H"""
                 <.dropdown open={@open}>
                   <:toggle>Dropdown Toggle</:toggle>
                   Dropdown Content
                 </.dropdown>
                 """)

        if open do
          assert result =~ ~s(<div class="dropdown dropdown-open">)
        else
          assert result =~ ~s(<div class="dropdown">)
        end

        assert result =~ ~s(Dropdown Toggle)
        assert result =~ ~s(Dropdown Content)
      end
    end

    test "open (details tag)" do
      for open <- [true, false] do
        assigns = %{open: open}

        assert result =
                 rendered_to_string(~H"""
                 <.dropdown tag="details" open={@open}>
                   <:toggle>Dropdown Toggle</:toggle>
                   Dropdown Content
                 </.dropdown>
                 """)

        if open do
          assert result =~ ~s(<details class="dropdown" open>)
        else
          assert result =~ ~s(<details class="dropdown">)
        end

        assert result =~ ~s(Dropdown Toggle)
        assert result =~ ~s(Dropdown Content)
      end
    end

    test "horizontal" do
      for horizontal <- ~w(left center right) do
        assigns = %{horizontal: horizontal}

        assert result =
                 rendered_to_string(~H"""
                 <.dropdown horizontal={@horizontal}>
                   <:toggle>Dropdown Toggle</:toggle>
                   Dropdown Content
                 </.dropdown>
                 """)

        assert result =~ ~s(<div class="dropdown dropdown-#{horizontal}">)
        assert result =~ ~s(Dropdown Toggle)
        assert result =~ ~s(Dropdown Content)
      end
    end

    test "vertical" do
      for vertical <- ~w(top middle bottom) do
        assigns = %{vertical: vertical}

        assert result =
                 rendered_to_string(~H"""
                 <.dropdown vertical={@vertical}>
                   <:toggle>Dropdown Toggle</:toggle>
                   Dropdown Content
                 </.dropdown>
                 """)

        assert result =~ ~s(<div class="dropdown dropdown-#{vertical}">)
        assert result =~ ~s(Dropdown Toggle)
        assert result =~ ~s(Dropdown Content)
      end
    end

    test "tag" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.dropdown tag="details">
                 <:toggle>Dropdown Toggle</:toggle>
                 Dropdown Content
               </.dropdown>
               """)

      assert result =~ ~s(<details class="dropdown">)
      assert result =~ ~s(<summary>Dropdown Toggle</summary>)
      assert result =~ ~s(Dropdown Content)

      assert result =
               rendered_to_string(~H"""
               <.dropdown tag="section">
                 <:toggle>Dropdown Toggle</:toggle>
                 Dropdown Content
               </.dropdown>
               """)

      assert result =~ ~s(<section class="dropdown">)
      assert result =~ ~s(Dropdown Toggle)
      assert result =~ ~s(Dropdown Content)
    end

    test "class" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.dropdown class="custom-class">
                 <:toggle>Dropdown Toggle</:toggle>
                 Dropdown Content
               </.dropdown>
               """)

      assert result =~ ~s(<div class="dropdown custom-class">)
      assert result =~ ~s(Dropdown Toggle)
      assert result =~ ~s(Dropdown Content)
    end

    test "overrideclass" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.dropdown overrideclass="override-class">
                 <:toggle>Dropdown Toggle</:toggle>
                 Dropdown Content
               </.dropdown>
               """)

      assert result =~ ~s(<div class="override-class">)
      assert result =~ ~s(Dropdown Toggle)
      assert result =~ ~s(Dropdown Content)
    end
  end

  describe "fieldset" do
    test "tag" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.fieldset>
                 <input type="text" />
               </.fieldset>
               """)

      assert result =~ ~s(<fieldset class="fieldset">)
      assert result =~ ~s(<input type="text">)

      assert result =
               rendered_to_string(~H"""
               <.fieldset tag="div">
                 <input type="text" />
               </.fieldset>
               """)

      assert result =~ ~s(<div class="fieldset">)
      assert result =~ ~s(<input type="text">)
    end

    test "class" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.fieldset class="custom-class">
                 <input type="text" />
               </.fieldset>
               """)

      assert result =~ ~s(<fieldset class="fieldset custom-class">)
      assert result =~ ~s(<input type="text">)
    end

    test "overrideclass" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.fieldset overrideclass="override-class">
                 <input type="text" />
               </.fieldset>
               """)

      assert result =~ ~s(<fieldset class="override-class">)
      assert result =~ ~s(<input type="text">)
    end

    test "legend slot" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.fieldset>
                 <:legend>Fieldset Legend</:legend>
                 <input type="text" />
               </.fieldset>
               """)

      assert result =~ ~s(<legend class="fieldset-legend">Fieldset Legend</legend>)
      assert result =~ ~s(<input type="text">)

      assert result =
               rendered_to_string(~H"""
               <.fieldset>
                 <:legend tag="label" class="custom-class">Fieldset Legend</:legend>
                 <input type="text" />
               </.fieldset>
               """)

      assert result =~ ~s(<label class="fieldset-legend custom-class">Fieldset Legend</label>)
      assert result =~ ~s(<input type="text">)
    end

    test "label slot" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.fieldset>
                 <:label>Input Label</:label>
                 <input type="text" id="input-id" />
               </.fieldset>
               """)

      assert result =~ ~s(<p class="label">Input Label</p>)
      assert result =~ ~s(<input type="text" id="input-id">)

      assert result =
               rendered_to_string(~H"""
               <.fieldset>
                 <:label tag="span" class="custom-class">Input Label</:label>
                 <input type="text" id="input-id" />
               </.fieldset>
               """)

      assert result =~
               ~s(<span class="label custom-class">Input Label</span>)

      assert result =~ ~s(<input type="text" id="input-id">)
    end
  end

  describe "hover_3d" do
    test "tag" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.hover_3d>
                 <div>3D Content</div>
               </.hover_3d>
               """)

      assert result =~ ~s(<div class="hover-3d">)
      assert result =~ ~s(<div>3D Content</div>)

      assert result =
               rendered_to_string(~H"""
               <.hover_3d tag="section">
                 <div>3D Content</div>
               </.hover_3d>
               """)

      assert result =~ ~s(<section class="hover-3d">)
      assert result =~ ~s(<div>3D Content</div>)
    end

    test "class" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.hover_3d class="custom-class">
                 <div>3D Content</div>
               </.hover_3d>
               """)

      assert result =~ ~s(<div class="hover-3d custom-class">)
      assert result =~ ~s(<div>3D Content</div>)
    end

    test "overrideclass" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.hover_3d overrideclass="override-class">
                 <div>3D Content</div>
               </.hover_3d>
               """)

      assert result =~ ~s(<div class="override-class">)
      assert result =~ ~s(<div>3D Content</div>)
    end
  end

  describe "hero" do
    test "tag" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.hero>
                 <p>Hero Content</p>
               </.hero>
               """)

      assert result =~ ~s(<div class="hero">)
      assert result =~ "<p>Hero Content</p>"

      assert result =
               rendered_to_string(~H"""
               <.hero tag="section">
                 <p>Hero Content</p>
               </.hero>
               """)

      assert result =~ ~s(<section class="hero">)
      assert result =~ "<p>Hero Content</p>"
    end

    test "class" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.hero class="custom-class">
                 <p>Hero Content</p>
               </.hero>
               """)

      assert result =~ ~s(<div class="hero custom-class">)
      assert result =~ "<p>Hero Content</p>"
    end

    test "overrideclass" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.hero overrideclass="override-class">
                 <p>Hero Content</p>
               </.hero>
               """)

      assert result =~ ~s(<div class="override-class">)
      assert result =~ "<p>Hero Content</p>"
    end

    test "content slot" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.hero>
                 <:content tag="main" class="custom-content-class">
                   <p>Hero Content</p>
                 </:content>
               </.hero>
               """)

      assert result =~ ~s(<main class="hero-content custom-content-class">)
      assert result =~ "<p>Hero Content</p>"
    end

    test "overlay slot" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.hero>
                 <:overlay tag="div" class="custom-overlay-class">
                   <p>Hero Overlay</p>
                 </:overlay>
                 <p>Hero Content</p>
               </.hero>
               """)

      assert result =~ ~s(<div class="hero-overlay custom-overlay-class">)
      refute result =~ "<p>Hero Overlay</p>"
      assert result =~ "<p>Hero Content</p>"
    end
  end

  describe "input" do
    test "color" do
      for color <- ~w(primary secondary accent neutral info success warning error) do
        assigns = %{color: color}

        assert result =
                 rendered_to_string(~H"""
                 <.input color={@color} />
                 """)

        assert result =~ ~s(<input class="input input-#{color}">)
      end
    end

    test "size" do
      for size <- ~w(xs sm md lg xl) do
        assigns = %{size: size}

        assert result =
                 rendered_to_string(~H"""
                 <.input size={@size} />
                 """)

        assert result =~ ~s(<input class="input input-#{size}">)
      end
    end

    test "style" do
      for style <- ~w(ghost) do
        assigns = %{style: style}

        assert result =
                 rendered_to_string(~H"""
                 <.input style={@style} />
                 """)

        assert result =~ ~s(<input class="input input-#{style}">)
      end
    end

    test "class" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.input class="custom-class" />
               """)

      assert result =~ ~s(<input class="input custom-class">)
    end

    test "overrideclass" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.input overrideclass="override-class" />
               """)

      assert result =~ ~s(<input class="override-class">)
    end
  end

  describe "loading" do
    test "style" do
      for style <- ~w(spinner dots ring ball bars) do
        assigns = %{style: style}

        assert result =
                 rendered_to_string(~H"""
                 <.loading style={@style} />
                 """)

        assert result =~ ~s(<div class="loading loading-#{style}">)
      end
    end

    test "size" do
      for size <- ~w(xs sm md lg xl) do
        assigns = %{size: size}

        assert result =
                 rendered_to_string(~H"""
                 <.loading size={@size} />
                 """)

        assert result =~ ~s(<div class="loading loading-#{size}">)
      end
    end

    test "tag" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.loading />
               """)

      assert result =~ ~s(<div class="loading">)

      assert result =
               rendered_to_string(~H"""
               <.loading tag="span" />
               """)

      assert result =~ ~s(<span class="loading">)
    end

    test "class" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.loading class="custom-class" />
               """)

      assert result =~ ~s(<div class="loading custom-class">)
    end

    test "overrideclass" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.loading overrideclass="override-class" />
               """)

      assert result =~ ~s(<div class="override-class">)
    end
  end

  describe "menu" do
    test "size" do
      for size <- ~w(xs sm md lg xl) do
        assigns = %{size: size}

        assert result =
                 rendered_to_string(~H"""
                 <.menu size={@size}>
                   <:item>Menu Item</:item>
                 </.menu>
                 """)

        assert result =~ ~s(<ul class="menu menu-#{size}">)
        assert result =~ ~s(<li class="">Menu Item</li>)
      end
    end

    test "direction" do
      for direction <- ~w(vertical horizontal) do
        assigns = %{direction: direction}

        assert result =
                 rendered_to_string(~H"""
                 <.menu direction={@direction}>
                   <:item>Menu Item</:item>
                 </.menu>
                 """)

        assert result =~ ~s(<ul class="menu menu-#{direction}">)
        assert result =~ ~s(<li class="">Menu Item</li>)
      end
    end

    test "tag" do
      for tag <- ["ul", "ol"] do
        assigns = %{tag: tag}

        assert result =
                 rendered_to_string(~H"""
                 <.menu tag={@tag}>
                   <:item>Menu Item</:item>
                 </.menu>
                 """)

        assert result =~ ~s(<#{tag} class="menu">)
        assert result =~ ~s(<li class="">Menu Item</li>)
      end
    end

    test "class" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.menu class="custom-class">
                 <:item>Menu Item</:item>
               </.menu>
               """)

      assert result =~ ~s(<ul class="menu custom-class">)
      assert result =~ ~s(<li class="">Menu Item</li>)
    end

    test "overrideclass" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.menu overrideclass="override-class">
                 <:item>Menu Item</:item>
               </.menu>
               """)

      assert result =~ ~s(<ul class="override-class">)
      assert result =~ ~s(<li class="">Menu Item</li>)
    end

    test "item slot" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.menu>
                 <:item class="custom-item-class" disabled>Menu Item</:item>
               </.menu>
               """)

      assert result =~ ~s(<li class="menu-disabled custom-item-class">Menu Item</li>)
    end

    test "item slot (title)" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.menu>
                 <:item title="Menu Title" class="custom-item-class" disabled>Menu Item</:item>
               </.menu>
               """)

      assert result =~ ~s(<li class="menu-disabled menu-title custom-item-class">Menu Title</li>)
    end
  end

  describe "progress" do
    test "color" do
      for color <- ~w(primary secondary accent neutral info success warning error) do
        assigns = %{color: color}

        assert result =
                 rendered_to_string(~H"""
                 <.progress color={@color} value={50} max={100} />
                 """)

        assert result =~ ~s(<progress max="100" value="50" class="progress progress-#{color}">)
      end
    end

    test "class" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.progress class="custom-class" value={50} max={100} />
               """)

      assert result =~ ~s(<progress max="100" value="50" class="progress custom-class">)
    end

    test "overrideclass" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.progress overrideclass="override-class" value={50} max={100} />
               """)

      assert result =~ ~s(<progress max="100" value="50" class="override-class">)
    end
  end

  describe "radio" do
    test "color" do
      for color <- ~w(primary secondary accent neutral info success warning error) do
        assigns = %{color: color}

        assert result =
                 rendered_to_string(~H"""
                 <.radio color={@color} />
                 """)

        assert result =~ ~s(<input type="radio" class="radio radio-#{color}">)
      end
    end

    test "size" do
      for size <- ~w(xs sm md lg xl) do
        assigns = %{size: size}

        assert result =
                 rendered_to_string(~H"""
                 <.radio size={@size} />
                 """)

        assert result =~ ~s(<input type="radio" class="radio radio-#{size}">)
      end
    end

    test "style" do
      for style <- ~w(ghost) do
        assigns = %{style: style}

        assert result =
                 rendered_to_string(~H"""
                 <.radio style={@style} />
                 """)

        assert result =~ ~s(<input type="radio" class="radio radio-#{style}">)
      end
    end

    test "type" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.radio type="text" />
               """)

      assert result =~ ~s(<input type="text" class="radio">)
    end

    test "class" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.radio class="custom-class" />
               """)

      assert result =~ ~s(<input type="radio" class="radio custom-class">)
    end

    test "overrideclass" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.radio overrideclass="override-class" />
               """)

      assert result =~ ~s(<input type="radio" class="override-class">)
    end
  end

  describe "range" do
    test "color" do
      for color <- ~w(primary secondary accent neutral info success warning error) do
        assigns = %{color: color}

        assert result =
                 rendered_to_string(~H"""
                 <.range color={@color} />
                 """)

        assert result =~ ~s(<input type="range" class="range range-#{color}">)
      end
    end

    test "size" do
      for size <- ~w(xs sm md lg xl) do
        assigns = %{size: size}

        assert result =
                 rendered_to_string(~H"""
                 <.range size={@size} />
                 """)

        assert result =~ ~s(<input type="range" class="range range-#{size}">)
      end
    end

    test "type" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.range type="number" />
               """)

      assert result =~ ~s(<input type="number" class="range">)
    end

    test "class" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.range class="custom-class" />
               """)

      assert result =~ ~s(<input type="range" class="range custom-class">)
    end

    test "overrideclass" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.range overrideclass="override-class" />
               """)

      assert result =~ ~s(<input type="range" class="override-class">)
    end
  end

  describe "select" do
    test "color" do
      for color <- ~w(primary secondary accent neutral info success warning error) do
        assigns = %{color: color}

        assert result =
                 rendered_to_string(~H"""
                 <.select color={@color}>
                   <option>Option 1</option>
                 </.select>
                 """)

        assert result =~ ~s(<select class="select select-#{color}">)
        assert result =~ ~s(<option>Option 1</option>)
      end
    end

    test "size" do
      for size <- ~w(xs sm md lg xl) do
        assigns = %{size: size}

        assert result =
                 rendered_to_string(~H"""
                 <.select size={@size}>
                   <option>Option 1</option>
                 </.select>
                 """)

        assert result =~ ~s(<select class="select select-#{size}">)
        assert result =~ ~s(<option>Option 1</option>)
      end
    end

    test "style" do
      for style <- ~w(ghost) do
        assigns = %{style: style}

        assert result =
                 rendered_to_string(~H"""
                 <.select style={@style}>
                   <option>Option 1</option>
                 </.select>
                 """)

        assert result =~ ~s(<select class="select select-#{style}">)
        assert result =~ ~s(<option>Option 1</option>)
      end
    end

    test "class" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.select class="custom-class">
                 <option>Option 1</option>
               </.select>
               """)

      assert result =~ ~s(<select class="select custom-class">)
      assert result =~ ~s(<option>Option 1</option>)
    end

    test "overrideclass" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.select overrideclass="override-class">
                 <option>Option 1</option>
               </.select>
               """)

      assert result =~ ~s(<select class="override-class">)
      assert result =~ ~s(<option>Option 1</option>)
    end

    test "option slot" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.select>
                 <:option value="1" selected>Option 1</:option>
                 <:option value="2">Option 2</:option>
               </.select>
               """)

      assert result =~ ~s(<option value="1" selected>Option 1</option>)
      assert result =~ ~s(<option value="2">Option 2</option>)
    end
  end

  describe "stats" do
    test "direction" do
      for direction <- ~w(vertical horizontal) do
        assigns = %{direction: direction}

        assert result =
                 rendered_to_string(~H"""
                 <.stats direction={@direction}>
                   <:stat title="Downloads" value="31K" />
                   <:stat title="New Users" value="4,200" />
                 </.stats>
                 """)

        assert result =~ ~s(<div class="stats stats-#{direction}">)
      end
    end

    test "tag" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.stats>
                 <:stat title="Downloads" value="31K" />
               </.stats>
               """)

      assert result =~ ~s(<div class="stats">)

      assert result =
               rendered_to_string(~H"""
               <.stats tag="section">
                 <:stat title="Downloads" value="31K" />
               </.stats>
               """)

      assert result =~ ~s(<section class="stats">)
    end

    test "class" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.stats class="custom-class">
                 <:stat title="Downloads" value="31K" />
               </.stats>
               """)

      assert result =~ ~s(<div class="stats custom-class">)
    end

    test "overrideclass" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.stats overrideclass="override-class">
                 <:stat title="Downloads" value="31K" />
               </.stats>
               """)

      assert result =~ ~s(<div class="override-class">)
    end

    test "stat slot" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.stats>
                 <:stat tag="article" class="custom-stat-class" title="Downloads" value="31K" desc="Number of downloads" />
               </.stats>
               """)

      assert result =~ ~s(<article class="stat custom-stat-class">)
      assert result =~ ~s(<div class="stat-title">Downloads</div>)
      assert result =~ ~s(<div class="stat-value">31K</div>)
      assert result =~ ~s(<div class="stat-desc">Number of downloads</div>)
      refute result =~ ~s(<div class="stat-figure">)

      assert result =
               rendered_to_string(~H"""
               <.stats>
                 <:stat
                   tag="article" class="custom-stat-class" title="Downloads" desc="Number of downloads"
                  >31K</:stat>
               </.stats>
               """)

      assert result =~ ~s(<article class="stat custom-stat-class">)
      assert result =~ ~s(<div class="stat-title">Downloads</div>)
      assert result =~ ~s(<div class="stat-value">31K</div>)
      assert result =~ ~s(<div class="stat-desc">Number of downloads</div>)
      refute result =~ ~s(<div class="stat-figure">)

      assert result =
               rendered_to_string(~H"""
               <.stats>
                 <:stat
                   tag="article" class="custom-stat-class" title="Downloads" value="31K" desc="Number of downloads"
                  ><img src="figure.svg" /></:stat>
               </.stats>
               """)

      assert result =~ ~s(<article class="stat custom-stat-class">)
      assert result =~ ~s(<div class="stat-title">Downloads</div>)
      assert result =~ ~s(<div class="stat-value">31K</div>)
      assert result =~ ~s(<div class="stat-desc">Number of downloads</div>)
      assert result =~ ~s(<div class="stat-figure"><img src="figure.svg"></div>)
    end
  end

  describe "swap" do
    test "active" do
      for active <- [true, false] do
        assigns = %{active: active}

        assert result =
                 rendered_to_string(~H"""
                 <.swap active={@active}>
                   <:on>On Content</:on>
                   <:off>Off Content</:off>
                 </.swap>
                 """)

        if active do
          assert result =~ ~s(<span class="swap swap-active">)
        else
          assert result =~ ~s(<span class="swap">)
        end

        assert result =~ ~s(<span class="swap-on">On Content</span>)
        assert result =~ ~s(<span class="swap-off">Off Content</span>)
      end
    end

    test "style" do
      for style <- ~w(flip rotate) do
        assigns = %{style: style}

        assert result =
                 rendered_to_string(~H"""
                 <.swap style={@style}>
                   <:on>On Content</:on>
                   <:off>Off Content</:off>
                 </.swap>
                 """)

        assert result =~ ~s(<span class="swap swap-#{style}">)
        assert result =~ ~s(<span class="swap-on">On Content</span>)
        assert result =~ ~s(<span class="swap-off">Off Content</span>)
      end
    end

    test "tag" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.swap>
                 <:on>On Content</:on>
                 <:off>Off Content</:off>
               </.swap>
               """)

      assert result =~ ~s(<span class="swap">)

      assert result =
               rendered_to_string(~H"""
               <.swap tag="div">
                 <:on>On Content</:on>
                 <:off>Off Content</:off>
               </.swap>
               """)

      assert result =~ ~s(<div class="swap">)
    end

    test "class" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.swap class="custom-class">
                 <:on>On Content</:on>
                 <:off>Off Content</:off>
               </.swap>
               """)

      assert result =~ ~s(<span class="swap custom-class">)
    end

    test "overrideclass" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.swap overrideclass="override-class">
                 <:on>On Content</:on>
                 <:off>Off Content</:off>
               </.swap>
               """)

      assert result =~ ~s(<span class="override-class">)
    end

    test "on slot" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.swap>
                 <:on class="custom-class">On Content</:on>
                 <:off>Off Content</:off>
               </.swap>
               """)

      assert result =~ ~s(<span class="swap-on custom-class">On Content</span>)
    end

    test "off slot" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.swap>
                 <:on>On Content</:on>
                 <:off class="custom-class">Off Content</:off>
               </.swap>
               """)

      assert result =~ ~s(<span class="swap-off custom-class">Off Content</span>)
    end
  end

  describe "tabs" do
    test "size" do
      for size <- ~w(xs sm md lg xl) do
        assigns = %{size: size}

        assert result =
                 rendered_to_string(~H"""
                 <.tabs size={@size}>
                   <:tab active>Tab 1</:tab>
                   <:tab>Tab 2</:tab>
                 </.tabs>
                 """)

        assert result =~ ~s(<div role="tablist" class="tabs tabs-#{size}">)
        assert result =~ ~s(<a href="#" class="tab tab-active">Tab 1</a>)
        assert result =~ ~s(<a href="#" class="tab">Tab 2</a>)
      end
    end

    test "placement" do
      for placement <- ~w(top bottom) do
        assigns = %{placement: placement}

        assert result =
                 rendered_to_string(~H"""
                 <.tabs placement={@placement}>
                   <:tab active>Tab 1</:tab>
                   <:tab>Tab 2</:tab>
                 </.tabs>
                 """)

        assert result =~ ~s(<div role="tablist" class="tabs tabs-#{placement}">)
        assert result =~ ~s(<a href="#" class="tab tab-active">Tab 1</a>)
        assert result =~ ~s(<a href="#" class="tab">Tab 2</a>)
      end
    end

    test "style" do
      for style <- ~w(border box lift) do
        assigns = %{style: style}

        assert result =
                 rendered_to_string(~H"""
                 <.tabs style={@style}>
                   <:tab active>Tab 1</:tab>
                   <:tab>Tab 2</:tab>
                 </.tabs>
                 """)

        assert result =~ ~s(<div role="tablist" class="tabs tabs-#{style}">)
        assert result =~ ~s(<a href="#" class="tab tab-active">Tab 1</a>)
        assert result =~ ~s(<a href="#" class="tab">Tab 2</a>)
      end
    end

    test "tag" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.tabs>
                 <:tab active>Tab 1</:tab>
                 <:tab>Tab 2</:tab>
               </.tabs>
               """)

      assert result =~ ~s(<div role="tablist" class="tabs">)

      assert result =
               rendered_to_string(~H"""
               <.tabs tag="section">
                 <:tab active>Tab 1</:tab>
                 <:tab>Tab 2</:tab>
               </.tabs>
               """)

      assert result =~ ~s(<section role="tablist" class="tabs">)
    end

    test "class" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.tabs class="custom-class">
                 <:tab active>Tab 1</:tab>
                 <:tab>Tab 2</:tab>
               </.tabs>
               """)

      assert result =~ ~s(<div role="tablist" class="tabs custom-class">)
    end

    test "overrideclass" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.tabs overrideclass="override-class">
                 <:tab active>Tab 1</:tab>
                 <:tab>Tab 2</:tab>
               </.tabs>
               """)

      assert result =~ ~s(<div role="tablist" class="override-class">)
    end

    test "tab slot" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.tabs>
                 <:tab href="/tab1" class="custom-tab-class" active>Tab 1</:tab>
                 <:tab href="/tab2">Tab 2</:tab>
               </.tabs>
               """)

      assert result =~ ~s(<a href="/tab1" class="tab tab-active custom-tab-class">Tab 1</a>)

      assert result =
               rendered_to_string(~H"""
               <.tabs>
                 <:tab tag="span" class="custom-tab-class" active>Tab 1</:tab>
                 <:tab href="/tab2">Tab 2</:tab>
               </.tabs>
               """)

      assert result =~ ~s(<span class="tab tab-active custom-tab-class">Tab 1</span>)
    end
  end

  describe "textarea" do
    test "value" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.textarea value="Textarea content"></.textarea>
               """)

      assert result =~ ~s(<textarea class="textarea">Textarea content</textarea>)
    end

    test "color" do
      for color <- ~w(primary secondary accent neutral info success warning error) do
        assigns = %{color: color}

        assert result =
                 rendered_to_string(~H"""
                 <.textarea color={@color} />
                 """)

        assert result =~ ~s(<textarea class="textarea textarea-#{color}">)
      end
    end

    test "size" do
      for size <- ~w(xs sm md lg xl) do
        assigns = %{size: size}

        assert result =
                 rendered_to_string(~H"""
                 <.textarea size={@size} />
                 """)

        assert result =~ ~s(<textarea class="textarea textarea-#{size}">)
      end
    end

    test "style" do
      for style <- ~w(ghost) do
        assigns = %{style: style}

        assert result =
                 rendered_to_string(~H"""
                 <.textarea style={@style} />
                 """)

        assert result =~ ~s(<textarea class="textarea textarea-#{style}">)
      end
    end

    test "class" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.textarea class="custom-class" />
               """)

      assert result =~ ~s(<textarea class="textarea custom-class">)
    end

    test "overrideclass" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.textarea overrideclass="override-class" />
               """)

      assert result =~ ~s(<textarea class="override-class">)
    end

    test "inner block slot" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.textarea>Textarea content</.textarea>
               """)

      assert result =~ ~s(<textarea class="textarea">Textarea content</textarea>)
    end
  end

  describe "toast" do
    test "horizontal" do
      for horizontal <- ~w(start center end) do
        assigns = %{horizontal: horizontal}

        assert result =
                 rendered_to_string(~H"""
                 <.toast horizontal={@horizontal}>
                   Toast Content
                 </.toast>
                 """)

        assert result =~ ~s(<div class="toast toast-#{horizontal}">)
        assert result =~ ~s(Toast Content)
      end
    end

    test "vertical" do
      for vertical <- ~w(top middle bottom) do
        assigns = %{vertical: vertical}

        assert result =
                 rendered_to_string(~H"""
                 <.toast vertical={@vertical}>
                   Toast Content
                 </.toast>
                 """)

        assert result =~ ~s(<div class="toast toast-#{vertical}">)
        assert result =~ ~s(Toast Content)
      end
    end

    test "tag" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.toast>
                 Toast Content
               </.toast>
               """)

      assert result =~ ~s(<div class="toast">)

      assert result =
               rendered_to_string(~H"""
               <.toast tag="section">
                 Toast Content
               </.toast>
               """)

      assert result =~ ~s(<section class="toast">)
    end

    test "class" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.toast class="custom-class">
                 Toast Content
               </.toast>
               """)

      assert result =~ ~s(<div class="toast custom-class">)
    end

    test "overrideclass" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.toast overrideclass="override-class">
                 Toast Content
               </.toast>
               """)

      assert result =~ ~s(<div class="override-class">)
    end
  end

  describe "toggle" do
    test "color" do
      for color <- ~w(primary secondary accent neutral info success warning error) do
        assigns = %{color: color}

        assert result =
                 rendered_to_string(~H"""
                 <.toggle color={@color} />
                 """)

        assert result =~ ~s(<input type="checkbox" class="toggle toggle-#{color}">)
      end
    end

    test "size" do
      for size <- ~w(xs sm md lg xl) do
        assigns = %{size: size}

        assert result =
                 rendered_to_string(~H"""
                 <.toggle size={@size} />
                 """)

        assert result =~ ~s(<input type="checkbox" class="toggle toggle-#{size}">)
      end
    end

    test "class" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.toggle class="custom-class" />
               """)

      assert result =~ ~s(<input type="checkbox" class="toggle custom-class">)
    end

    test "overrideclass" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.toggle overrideclass="override-class" />
               """)

      assert result =~ ~s(<input type="checkbox" class="override-class">)
    end
  end

  describe "tooltip" do
    test "color" do
      for color <- ~w(primary secondary accent neutral info success warning error) do
        assigns = %{color: color}

        assert result =
                 rendered_to_string(~H"""
                 <.tooltip color={@color} tip="Tooltip Content">
                   Hover me
                 </.tooltip>
                 """)

        assert result =~ ~s(</div>)
        assert result =~ ~s(data-tip="Tooltip Content")
        assert result =~ ~s(class="tooltip tooltip-#{color}")
        assert result =~ ~s(Hover me)
      end
    end

    test "placement" do
      for placement <- ~w(top right bottom left) do
        assigns = %{placement: placement}

        assert result =
                 rendered_to_string(~H"""
                 <.tooltip placement={@placement} tip="Tooltip Content">
                   Hover me
                 </.tooltip>
                 """)

        assert result =~ ~s(</div>)
        assert result =~ ~s(data-tip="Tooltip Content")
        assert result =~ ~s(class="tooltip tooltip-#{placement}")
        assert result =~ ~s(Hover me)
      end
    end

    test "open" do
      for open <- [true, false] do
        assigns = %{open: open}

        assert result =
                 rendered_to_string(~H"""
                 <.tooltip open={@open} tip="Tooltip Content">
                   Hover me
                 </.tooltip>
                 """)

        if open do
          assert result =~ ~s(class="tooltip tooltip-open")
        else
          assert result =~ ~s(class="tooltip")
        end

        assert result =~ ~s(Hover me)
        assert result =~ ~s(</div>)
        assert result =~ ~s(data-tip="Tooltip Content")
      end
    end

    test "class" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.tooltip class="custom-class" tip="Tooltip Content">
                 Hover me
               </.tooltip>
               """)

      assert result =~ ~s(</div>)
      assert result =~ ~s(data-tip="Tooltip Content")
      assert result =~ ~s(class="tooltip custom-class")
    end

    test "overrideclass" do
      assigns = %{}

      assert result =
               rendered_to_string(~H"""
               <.tooltip overrideclass="override-class" tip="Tooltip Content">
                 Hover me
               </.tooltip>
               """)

      assert result =~ ~s(</div>)
      assert result =~ ~s(data-tip="Tooltip Content")
      assert result =~ ~s(class="override-class")
    end
  end
end
