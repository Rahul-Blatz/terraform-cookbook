### Pre/Post Conditions
- Terraforms allows you to create custom validations for resources, modules or data sources with pre/post conditions.

- Sets the custom rules during the execution of `terraform plan`.

- The precondition will be checked just before the rendering of the plan and the 
postcondition will be checked just after the rendering.

- Create a `lifecycle` block and inside that `precondition` and `postcondition` block. Each block has `condition` and `error_message` property.