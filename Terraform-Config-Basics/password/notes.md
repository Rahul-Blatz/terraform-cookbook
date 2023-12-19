### Passwords
- There are circumstances when resources requires passwords such as account creds, VMs or db connection strings.

- You can make use of `random` provider to generate a random string to be used as a password

- In our case, we make use of `random_password.password.result` to set the value of the `admin_password` property.