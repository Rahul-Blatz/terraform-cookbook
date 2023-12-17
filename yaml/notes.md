### YAML Files reading
- You can make use of external sources for configurations from files like yaml or json. (Which will be useful in CI CD)

- In our case, we make use of two built in functions `yamldecode` and `file` to retrieve the data from the yaml file and decode them in a local variable.

- Then we use those variables in `address_space` property 

- We make use of `for_each` to parse through the subnets in the yaml file and retrieve those values to assign it to the properties.

- We can make use of `jsondecode` to decode the json files.