### Scaling environment

- Type-1 is to create different folder for different environments and copy paste all of the code which will result in duplication of codes.

- Only change we have to make in Type-1 is to change the variable's values. Like `ENV` = `dev` or `prod` or `test`.

- Type-1 is helpful when there are difference in the infrastructure among the environments. And also we can edit or modify the resources without affecting the other envs.

- Type-2 is to create different environment variables values for each environment and while running `terraform plan` or `terraform apply` we add the option `-var-file` for the corresponding environment.

- Type-2 doesn't have duplicate codes