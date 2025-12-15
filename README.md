[![CircleCI](https://dl.circleci.com/status-badge/img/gh/sul-dlss/sdr_view_components/tree/main.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/sul-dlss/sdr_view_components/tree/main)
[![codecov](https://codecov.io/github/sul-dlss/sdr_view_components/graph/badge.svg?token=VGFL92KY3E)](https://codecov.io/github/sul-dlss/sdr_view_components)
[![Gem Version](https://badge.fury.io/rb/sdr_view_components.svg)](https://badge.fury.io/rb/sdr_view_components)

# SdrViewComponents

A rails gem to provide reusable view components used throughout the SDR applications and implement
component library assets.

# Installation

Add to gemfile:

```
gem 'sdr_view_components'
```

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
      <% dropdown.with_item do %>
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

The `:dark` variation supports providing an rgb value via the `background_color` param in order to override the default dark background, for example:

```
<%= render SdrViewComponents::Structure::HeaderComponent.new(title: 'Test Header', subtitle: 'Test Subtitle', variant: :dark, rgb_color_str: '1, 104, 149') do |header| %>

...

<% end %>
```

By default, the SUL Rosette is included in the header, this can be disabled by setting `rosette: false` in the parameter list when instantiating the header.

### Form components

SdrViewComponents provides a wrapper for several [ActionView::Helper::Tags](https://api.rubyonrails.org/v8.1.1/classes/ActionView/Helpers/Tags.html).

Currently supported tags:
- Checkbox
- File
- RadioButton
- TextArea
- TextField

#### Composed form components

SdrViewComponents provides fully composed (label, help text, and validation) instances of the above components as:

- SdrViewComponents::Forms::CheckboxComponent
- SdrViewComponents::Forms::FileComponent
- SdrViewComponents::Forms::RadioButtonComponent
- SdrViewComponents::Forms::TextAreaComponent
- SdrViewComponents::Forms::TextFieldComponent

At a minimum, each of these components must be provided wih the `form:` and `field_name:` parameters. Additionally, you can provide prefixed parameters that will be passed the the individual parts of the components:

- `container_`: is used to pass arguments to the surrounding `div` for the component.
- `input_`: is used to pass arguments to the actual input component.
- `label_`: is used to pass arguments to the label for the component.
- `help_`: is used to pass arguments to the help text available for the component.
- `error_`: is used to pass arguments to the validation output of the component.

TODO:
- Outline the supported params for each prefix
- Provide an example instantiation and output

#### Basic form components

Each of the supported components above uses the provided "basic" components:

- SdrViewComponents::Forms::BasicCheckboxComponent
- SdrViewComponents::Forms::BasicFileComponent
- SdrViewComponents::Forms::BasicRadioButtonComponent
- SdrViewComponents::Forms::BasicTextAreaComponent
- SdrViewComponents::Forms::BasicTextFieldComponent

At a minimum, each of these components must be provided wih the `form:` and `field_name:` parameters. Additionally, you can provide additional parameters that will be passed to the standard ActionView::Helpers::Tag.

### General usage:

```
<% render SdrViewComponent::....>
```
