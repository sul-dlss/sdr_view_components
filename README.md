[![CircleCI](https://dl.circleci.com/status-badge/img/gh/sul-dlss/sdr_view_components/tree/main.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/sul-dlss/sdr_view_components/tree/main)
[![codecov](https://codecov.io/github/sul-dlss/sdr_view_components/graph/badge.svg?token=VGFL92KY3E)](https://codecov.io/github/sul-dlss/sdr_view_components)
[![Gem Version](https://badge.fury.io/rb/sdr_view_components.svg)](https://badge.fury.io/rb/sdr_view_components)

# SdrViewComponents

A rails gem to provide reusable view components used throughout the SDR applications and implement component library assets.

# Installation

Add to gemfile:

```
gem 'sdr_view_components'
```

## Requirements

This set of components relies on the component library stylesheets, add:

```
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/sul-dlss/component-library@v2025-09-11/styles/sul.css">
<%= stylesheet_link_tag "sdr_view_components", "data-turbo-track": "reload" %>
```

with the most recent date tagged release to your `application.html.erb` layout file.

## JavaScript

Some components require JavaScript. The gem ships Stimulus controllers under `app/javascript/sdr_view_components/` and registers that path with the asset pipeline automatically.

The controllers that use Bootstrap's JavaScript import it as an ES module (`import * as bootstrap from "bootstrap"`), so `bootstrap` must be pinned to an ES module build of Bootstrap. The UMD `bootstrap.bundle.min.js` has no ES module exports and won't work. For example, in `config/importmap.rb`:
```ruby
pin "bootstrap", to: "https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/+esm"
```

Here is an example of how to add a Stimulus controller:

The disappearing toast uses `sdr_view_components/toast_controller` to remove itself from the DOM after its fade-out animation completes.

Add to `config/importmap.rb`:
```ruby
pin "sdr_view_components/toast_controller", to: "sdr_view_components/toast_controller.js"
```

Register the controller in `app/javascript/controllers/index.js`:
```javascript
import { application } from "controllers/application"
import ToastController from "sdr_view_components/toast_controller"

application.register("sdr-toast", ToastController)
```

`SdrViewComponents::TabForm::TabListComponent` (see [Tab form components](#tab-form-components) below) similarly ships three controllers: `sdr_view_components/tab_error_controller`, `sdr_view_components/tab_link_controller`, and `sdr_view_components/tab_nav_controller`. Pin and register each the same way, using the `sdr-tab-error`, `sdr-tab-link`, and `sdr-tab-nav` identifiers respectively:

```ruby
pin "sdr_view_components/tab_error_controller", to: "sdr_view_components/tab_error_controller.js"
pin "sdr_view_components/tab_link_controller", to: "sdr_view_components/tab_link_controller.js"
pin "sdr_view_components/tab_nav_controller", to: "sdr_view_components/tab_nav_controller.js"
```

```javascript
import { application } from "controllers/application"
import TabErrorController from "sdr_view_components/tab_error_controller"
import TabLinkController from "sdr_view_components/tab_link_controller"
import TabNavController from "sdr_view_components/tab_nav_controller"

application.register("sdr-tab-error", TabErrorController)
application.register("sdr-tab-link", TabLinkController)
application.register("sdr-tab-nav", TabNavController)
```

`SdrViewComponents::Elements::Tabs::TabListComponent`'s `collapse_below` option (see [General usage](#general-usage) below) ships `sdr_view_components/tab_select_controller`, registered as `sdr-tab-select`:

```ruby
pin "sdr_view_components/tab_select_controller", to: "sdr_view_components/tab_select_controller.js"
```

```javascript
import { application } from "controllers/application"
import TabSelectController from "sdr_view_components/tab_select_controller"

application.register("sdr-tab-select", TabSelectController)
```

## Usage

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

#### Fieldset component

`SdrViewComponents::Forms::FieldsetComponent` renders a `<fieldset>` for grouping related fields (e.g. a set of checkboxes) that don't belong to a single bound form field. It supports a `label:` (or a `legend` slot for custom markup), `tooltip:`, `mark_required:`, `help_text:`, and a `help_link` slot. Any other keyword arguments (`id:`, `data:`, `aria:`, etc.) are passed through to the `<fieldset>` tag.

### Tab form components

SdrViewComponents provides components for rendering a tabbed form, where a form's fields are split across tabs rather than shown all at once:

- `SdrViewComponents::TabForm::TabListComponent` -- renders the tab navigation and tab panes. It doesn't render a `<form>` tag itself.
- `SdrViewComponents::TabForm::TabComponent` -- a single tab, rendered via `TabListComponent#with_tab`.
- `SdrViewComponents::TabForm::HiddenFieldsFormComponent` -- renders the one real `<form>` tag backing the tabbed form. It only contains hidden fields; the visible fields (rendered inside `TabListComponent`'s panes) associate with this form via the HTML `form` attribute rather than DOM nesting, since panes aren't necessarily inside the `<form>`.
- `SdrViewComponents::TabForm::TabbedFormBuilder` -- a `FormBuilder` that automatically sets the `form` attribute (pointing at the `HiddenFieldsFormComponent`'s form id) on every field it builds.
- `SdrViewComponents::TabForm::PaneComponent` -- generic tab-pane chrome (optional header/help/footer, Bootstrap `tab-pane` classes, and the target wiring the `sdr-tab-error` controller needs). Wrap it in an app-specific component if you need pane-level buttons or layout beyond what it provides.

Panes passed to `TabListComponent#with_pane` can be any renderable object (a `ViewComponent`, a block, etc.) -- the caller supplies its own pane component, whether that's `PaneComponent` directly or a wrapper around it. If the pane responds to `active_tab_name=`, `TabListComponent` sets it centrally, so panes don't need `active_tab_name` passed to them individually.

`TabListComponent` requires JavaScript to mark tabs containing invalid fields -- see the `sdr-tab-error` controller under [JavaScript](#javascript) above.

A minimal example:

```erb
<%= render SdrViewComponents::TabForm::HiddenFieldsFormComponent.new(model: @work_form, id: 'tabbed_form', hidden_fields: %i[lock version]) %>

<%= render SdrViewComponents::TabForm::TabListComponent.new(id: 'tabbed_form', active_tab_name: :details) do |tab_list| %>
  <% tab_list.with_tab(label: 'Details', tab_name: :details, mark_required: true) %>
  <% tab_list.with_tab(label: 'Notes', tab_name: :notes) %>

  <% form_with(model: @work_form, html: { id: 'tabbed_form' }, builder: SdrViewComponents::TabForm::TabbedFormBuilder) do |form| %>
    <% tab_list.with_pane(SdrViewComponents::TabForm::PaneComponent.new(tab_name: :details, label: 'Details')) do %>
      <%= render SdrViewComponents::Forms::TextFieldComponent.new(form:, field_name: :title) %>
    <% end %>

    <% tab_list.with_pane(SdrViewComponents::TabForm::PaneComponent.new(tab_name: :notes, label: 'Notes')) do %>
      <%= render SdrViewComponents::Forms::TextAreaComponent.new(form:, field_name: :notes) %>
    <% end %>
  <% end %>
<% end %>
```

See the Lookbook preview for `SdrViewComponents::TabForm::TabListComponent` for a runnable example.

### General usage:

`SdrViewComponents::Elements::Tabs::TabListComponent` accepts a `collapse_below:` option (one of `:sm`, `:md`, `:lg`, `:xl`, `:xxl`). When given, the tabs are replaced with a `<select>` below that Bootstrap breakpoint instead of wrapping or scrolling -- the `<select>` drives the same Bootstrap tab JavaScript as the tabs, so panes switch the same way regardless of which control is visible. Leave it unset (the default) to always render the tabs. This requires the `sdr-tab-select` controller -- see [JavaScript](#javascript) above.

```erb
<%= render SdrViewComponents::Elements::Tabs::TabListComponent.new(variant: :underline, collapse_below: :xl) do |tab_list| %>
  <% tab_list.with_tab(label: 'Details', id: 'details-tab', pane_id: 'details-pane', active: true) %>
  <% tab_list.with_tab(label: 'History', id: 'history-tab', pane_id: 'history-pane') %>

  <% tab_list.with_pane(id: 'details-pane', tab_id: 'details-tab', active: true) do %>
    <p>Details pane content.</p>
  <% end %>

  <% tab_list.with_pane(id: 'history-pane', tab_id: 'history-tab') do %>
    <p>History pane content.</p>
  <% end %>
<% end %>
```

```
<% render SdrViewComponent::....>
```

### Navigation components

SdrViewComponents provides components for building navigation bar items and dropdown menus:

- `SdrViewComponents::Elements::Navigation::NavItemComponent` -- a single navigation link (or plain text, if no `path:` is given).
- `SdrViewComponents::Elements::Navigation::DropdownMenuComponent` -- a Bootstrap dropdown menu. Items are added via `with_item`, and can be any renderable object -- typically one of the components below.
- `SdrViewComponents::Elements::Navigation::DropdownLinkComponent` -- a link within a dropdown menu (renders with the `dropdown-item` class via `link_to`). Accepts `label:`, `link:`, `classes:`, `disabled:` (adds the `disabled` class), and any additional options passed on to `link_to`.
- `SdrViewComponents::Elements::Navigation::DropdownHeaderComponent` -- a non-interactive section label within a dropdown menu.
- `SdrViewComponents::Elements::Navigation::DropdownDividerComponent` -- a horizontal divider between groups of items within a dropdown menu.

```erb
<ul class="navbar-nav">
  <%= render SdrViewComponents::Elements::Navigation::NavItemComponent.new(text: 'Home', path: '/') %>

  <%= render SdrViewComponents::Elements::Navigation::DropdownMenuComponent.new(text: 'Options') do |dropdown| %>
    <% dropdown.with_item do %>
      <%= render SdrViewComponents::Elements::Navigation::DropdownHeaderComponent.new(text: 'Section 1') %>
    <% end %>
    <% dropdown.with_item do %>
      <%= render SdrViewComponents::Elements::Navigation::DropdownLinkComponent.new(label: 'Action', link: '#') %>
    <% end %>
    <% dropdown.with_item do %>
      <%= render SdrViewComponents::Elements::Navigation::DropdownDividerComponent.new %>
    <% end %>
    <% dropdown.with_item do %>
      <%= render SdrViewComponents::Elements::Navigation::DropdownLinkComponent.new(label: 'Another action', link: '#') %>
    <% end %>
  <% end %>
</ul>
```

## Component library version
The [component-library](https://github.com/sul-dlss/component-library/) version is set in `lib/sdr_view_components/configuration.rb`.

```
def initialize
  # Default URL for the component library assets
  @component_library_url = 'https://cdn.jsdelivr.net/gh/sul-dlss/component-library@v2026-01-27'
end
```

## Lookbook

[Lookbook](https://lookbook.build/) provides a component browser for the components.

### Creating previews
For a component to appear in Lookbook, it must have a preview. See `spec/components/previews/sdr_view_components`

Previews can easily be created with the `viewComponentPreview` prompt. For example: `/viewComponentPreview SpinnerComponent`.

### Running locally

`bin/rails s`

Lookbook will then be available at: http://localhost:3000/lookbook

### Adding to another app

When performing development in an app that is using SdrViewComponents, it may be helpful to be running Lookbook in that app (instead of having to run a separate local instance of it).

To run Lookbook in that app:
1. Add Lookbook to `Gemfile.rb`:
```
group :development do
  gem 'lookbook'
end
```
2. Add routes to `routes.rb`:
```
if Rails.env.development?
  mount SdrViewComponents::Engine => '/sdr_view_components'
  mount Lookbook::Engine, at: '/lookbook'
end
```
3. Add `config/initializers/sdr_view_components.rb`:
```
SdrViewComponents.configure do |config|
  config.component_library_url = Settings.component_library.url
end
```
It is recommended to change the component library URL to a configuration in the app instead of hardcoding in layouts.

When your app is running locally, Lookbook will be available at: http://localhost:3000/lookbook