### Count Args

- There are cases where you want to provision the same resource multiple times. So, instead of just copy pasting the resource multiple times and increasing duplicate codes. We can make use of the `count` argument.

- This is only applicable when the resources are identical.

- In our case, the resource `azurerm_linux_web_app` has an argument `count` and has the value `var.webapp_count` which is 2. So it will provision 2 counts of identical web app resource without needing to duplicate the code.