### Variables 
- Instead of hardcoding the values of the properties in the terraform configurations, we use dynamic values AKA Variables.

-> In the `main.tf` file, we create a variable declaration with a unique variable name (`resource_group_name` and `location`).
-> the `description` property is optional and can have a detailed info about the variable.
-> the `default` property is also optional, without setting a default value, it is mandatory to provide value dynamically

-> Then we modify the configuration that refers to the variables that we have declared.

-> In the same folder as `main.tf` file, we create another file with the extension `.tfvars` and set the values for the variables declared in main.tf file.

-> We can also give a variable's value during runtime. Use -var option while running terraform plan or apply command

`terraform plan -var "location=asia"`

-> when you try to use both tfvars and options in command line, the option value will override the value of tfvars file.