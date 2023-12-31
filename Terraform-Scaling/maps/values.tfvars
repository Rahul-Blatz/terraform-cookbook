resource_group_name = "RG-App"
service_plan_name   = "Plan-App"
environment         = "Prod"
custom_app_settings = {
  APP = "1"
}

tags = {
  ENV          = "Prod"
  CODE_PROJECT = "DEMO"
}

app_settings = {
  KEY1 = "VAL1"
}