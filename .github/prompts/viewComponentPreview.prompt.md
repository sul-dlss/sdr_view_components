## Reusable Prompt: Generate ViewComponent Previews

Use this prompt to generate or update Lookbook-compatible ViewComponent previews for this repository.

You are helping with Ruby ViewComponent previews in the SDR View Components project.

### Goal
Create preview examples that clearly demonstrate component behavior, with explicit user choice about which component arguments are shown.

### Inputs
Accept either:
1. A component file path.
2. A fully-qualified component class name.

### Critical Rules (Apply These First)
**Must Do:**
1. Do not include data, input_data, classes, id, or style arguments unless explicitly requested.
2. Ask before modifying an existing preview file or method.
3. Respect variant coverage: create one example per variant value; only combine non-variant args with default variant.

### Required Workflow
1. Inspect the target component API and identify initializer arguments (required vs optional) and slot/block APIs.
2. Ask the user which arguments should be demonstrated in previews.
3. If the user did not pre-specify arguments, present an interactive list of initializer args and optional slot APIs.

### Repository Conventions (Structure & Format)
- Place previews under `spec/components/previews` with namespacing that mirrors the component namespace.
- Use `ViewComponent::Preview` classes with descriptive, unique method names.
- Use `@!group` and `@!endgroup` to group variants of an argument or examples that demonstrate the same concept. `@!group` and `@!endgroup` should only be used when there are multiple examples to group.
- Use template-backed preview methods with `.html.erb` files for complex slot/block examples.

### Variant Coverage Policy (If Component Has Variants)
1. Create one preview example for each supported variant value.
2. For non-variant arguments, create combinations only with the default variant preview.
3. Do not generate a full cross-product of all non-variant args across all variant values.
4. If argument prioritization is needed, ask the user to choose priority args for that run.

### Form Component Conventions
When previewing form components (components in the `forms` namespace):
1. **Template-backed methods required**: Use `.html.erb` template files because form helpers (`form_with`, `form_with(model:)`) are only available in view context, not in Ruby preview methods.
2. **FormBuilder requirement**: Basic form components (e.g., `BasicCheckboxComponent`) require a `FormBuilder` object. Supply it via `form_with(url:, scope:)` in templates.
3. **FieldComponent slots**: Form field components that inherit from `FieldComponent` expose `additional_container_content` as a renderable slot. Include previews of this slot in examples.
4. **Help text variant**: Components using `FieldComponent` may use the `help_text_below` variant to position help text after the input. Demonstrate both inline and below-input help text when applicable.
5. **Error state previews**: If a form component's model validates, demonstrate the error state by calling `model.valid?` to trigger validation, then render the component with the invalid model.
6. **Sample models**: Use small inline `ActiveModel::Model` classes defined within the preview class for consistent, reusable test data.
7. **Basic form components**: Basic form components (e.g., `BasicCheckboxComponent`) should be placed in `spec/components/previews/sdr_view_components/forms/basic`.

### Lookbook Alignment
Follow Lookbook guide conventions: https://lookbook.build/guide

### Output Requirements
Generate or update the following as needed:
1. Preview Ruby class file.
2. Optional .html.erb preview template files for slot-heavy/complex previews.
3. Realistic sample values for preview readability.
4. Grouped and named preview methods that communicate intent.

### Existing Reference Patterns In This Repo
1. spec/components/previews/sdr_view_components/elements/toast_component_preview.rb
2. spec/components/previews/sdr_view_components/structure/header_component_preview.rb
3. spec/components/previews/sdr_view_components/structure/header_component_preview/light_variant.html.erb
4. spec/components/previews/sdr_view_components/forms/basic_file_component_preview.rb (minimal form component)
5. spec/components/previews/sdr_view_components/forms/file_component_preview.rb (form field component with slots)

### Verification Checklist
Before finalizing, verify all of the following:
1. Constant names and file paths are correct.
2. Preview render calls and arguments match the component API.
3. Slot methods used in previews are valid for the component.
4. Preview method names are unique and descriptive.
5. Lookbook can discover the generated previews.
6. Grouping and template-backed behavior align with Lookbook guide expectations.
7. The argument-selection interaction happened and is reflected in output.
8. The variant policy is respected: all variants covered; non-variant combos only on default variant.

### Interaction Script To Use
Use the following questions in order when details are missing:
1. Which component should I target (path or class name)?
2. Which initializer arguments should be demonstrated?
3. Should I include slot/block examples, and if yes, which slots?
4. Should I create only new preview methods or also modify existing ones?
5. If there are many optional args, which ones should be prioritized?

### Final Response Format
When done, return:
1. What files were created or changed.
2. Which arguments and variants were demonstrated.
3. Any arguments intentionally excluded and why.
4. Any assumptions that still need user confirmation.
