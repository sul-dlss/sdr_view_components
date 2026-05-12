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

### General usage:

```
<% render SdrViewComponent::....>
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