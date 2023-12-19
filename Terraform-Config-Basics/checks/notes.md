### Checks
- Checks allows us to make sure that the infra created or provisioned works as it should.

- In our case, we will create a Azure app service instance and try to check if the instance is running and returns a HTTP status code - 200

- We create a `data` block inside the `check` block that runs a HTTP GET with the given URL which is a default hostname url. This is the data that is used to check with something

- Once we have our data, we are gonna create an `assert` block to check for our condition. That is if the data produces status code 200 or not.

- Unlike pre/post condition, check doesn't throw an error. It just gives out warning message and continues the flow.