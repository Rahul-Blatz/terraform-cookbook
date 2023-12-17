### Local variables
- used to create a combination of variables in a value.

-> you create as many `variable` as you want and its value in the tf vars file like you usually do.

-> Then we will add a `locals` local variable called `resource_name` in the main.tf file with the help of concatenation of variables `${}` syntax.

-> It can’t be redefined in the Terraform variables file (tfvars), with environment variables, or with the -var CLI args.