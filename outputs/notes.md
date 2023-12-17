### Outputs
- we can output the values from the provisioned resources after the terraform execution.

+ These outputs can be used by other terraform configs or external programs

+ You can also transmit the info through modules 

+ Create a `output` block with a name and provide its `description` property and `value` property.

+ In our case, we have name of the webapp and hostname of the webapp as outputs. These outputs will be displayed at the end of the execution.

+ We can also use `terraform output` command in the CLI or Using the `terraform_remote_state` data source to retrieve the values of the output.