### Alias 
- Alias is used to provision resources in multiple Azure subscriptions in the same terraform configuration.

-> we create two providers with different `subscription_id` and add a property of `alias` to uniquely identify them

-> In our case, the different subscriptions have alias as `project1-sub` and `project2-sub`

-> And then in the resource group that we have created , have the property `provider` whose value is their corresponding subscription's alias