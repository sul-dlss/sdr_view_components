[![codecov](https://codecov.io/github/sul-dlss/sdr_view_components/graph/badge.svg?token=VGFL92KY3E)](https://codecov.io/github/sul-dlss/sdr_view_components)

# SdrViewComponents

A rails gem to provide reusable view components used throughout the SDR applications and implement
component library assets.

# NOTE: Under Development

Until initial development is complete and this gem is published, it can only be used locally. Install by cloning the repository to your local system and then including it in your gemfile as:

```
gem 'sdr_view_components', path: '../sdr_view_components'
```

Or via github path

## Requirements

This set of components relies on the component library stylesheets, add:

```
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/sul-dlss/component-library@v2025-09-11/styles/sul.css">
```

with the most recent date tagged release to your `application.html.erb` layout file.

## Usage

### Add the SUL Header to your application

Supported header variations are `:dark`, `:light`, and `:white` (default is `:light`)

```
<%= render SdrViewComponents::Structure::HeaderComponent.new(title: 'Test Header', subtitle: 'Test Subtitle', variant: :dark) do |header| %>
  <% header.with_primary_navigation_link do %>
    <%= render SdrViewComponents::Elements::Navigation::NavItemComponent.new(text: 'Home', path: '#') %>
  <% end %>
  <% header.with_primary_navigation_link do %>
    <%= render SdrViewComponents::Elements::Navigation::DropdownMenuComponent.new(text: 'Logged in: amcollie-preview-dropdown') do |dropdown| %>
      <% dropdown.with_link do %>
        <%= link_to 'Logout', '/Shibboleth.sso/Logout', class: 'dropdown-item' %>
      <% end %>
    <% end %>
    <%# ... all primary nav links %>
  <% end %>
  <% header.with_secondary_navigation_link do %>
    <%= render SdrViewComponents::Elements::Navigation::NavItemComponent.new(text: 'Option', path: '/item1') %>
    <%# ... all secondary nav links>
  <% end %>
<% end %>
```

The `:dark` variation supports providing an rgb value via the `rgb_color_str` param in order to override the default dark background, for example:

```
<%= render SdrViewComponents::Structure::HeaderComponent.new(title: 'Test Header', subtitle: 'Test Subtitle', variant: :dark, rgb_color_str: '1, 104, 149') do |header| %>

...

<% end %>
```

### General usage:

```
<% render SdrViewComponent::....>
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
