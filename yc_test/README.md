# Main terraform config

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_yandex"></a> [yandex](#requirement\_yandex) | 0.122.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | 0.122.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_lamp-server"></a> [lamp-server](#module\_lamp-server) | ../yc_lamp_lemp | n/a |
| <a name="module_lemp-server"></a> [lemp-server](#module\_lemp-server) | ../yc_lamp_lemp | n/a |

## Resources

| Name | Type |
|------|------|
| [yandex_lb_network_load_balancer.lb1](https://registry.terraform.io/providers/yandex-cloud/yandex/0.122.0/docs/resources/lb_network_load_balancer) | resource |
| [yandex_lb_target_group.acdc](https://registry.terraform.io/providers/yandex-cloud/yandex/0.122.0/docs/resources/lb_target_group) | resource |
| [yandex_vpc_network.net1](https://registry.terraform.io/providers/yandex-cloud/yandex/0.122.0/docs/resources/vpc_network) | resource |
| [yandex_vpc_subnet.subnet1](https://registry.terraform.io/providers/yandex-cloud/yandex/0.122.0/docs/resources/vpc_subnet) | resource |
| [yandex_vpc_subnet.subnet2](https://registry.terraform.io/providers/yandex-cloud/yandex/0.122.0/docs/resources/vpc_subnet) | resource |
| [terraform_remote_state.yc-bucket](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_zone-a"></a> [zone-a](#input\_zone-a) | Availability zone | `string` | `"ru-central1-a"` | no |
| <a name="input_zone-b"></a> [zone-b](#input\_zone-b) | Availability zone | `string` | `"ru-central1-b"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_external_ip4_lamp"></a> [external\_ip4\_lamp](#output\_external\_ip4\_lamp) | The LAMP server's external IP address |
| <a name="output_external_ip4_lemp"></a> [external\_ip4\_lemp](#output\_external\_ip4\_lemp) | The LEMP server's external IP address |
| <a name="output_internal_ip4_lamp"></a> [internal\_ip4\_lamp](#output\_internal\_ip4\_lamp) | The LAMP server's internal IP address |
| <a name="output_internal_ip4_lemp"></a> [internal\_ip4\_lemp](#output\_internal\_ip4\_lemp) | The LEMP server's internal IP address |
| <a name="output_s3_bucket_name"></a> [s3\_bucket\_name](#output\_s3\_bucket\_name) | The name of the bucket in which tfstate file is stored |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
