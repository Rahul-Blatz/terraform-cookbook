### Dependency
- Dependency lets you create a type of condition such that, only after the resource that it is dependent on is created, will it be created.

- two types of dependency -> Implicit and Explicit dependency.

- Explicit dependency -> makes use of `depends_on` property. In this, the array consists of resources that must be created before this current resource.

- Implicit dependency -> makes use of dot operator (`azurerm_resource_group.rg.name`)