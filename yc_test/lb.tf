resource "yandex_lb_target_group" "acdc" {
  name        = "web-servers-group"
  description = "Target group of web-servers"

  target {
    address   = module.lemp-server.internal_ip4
    subnet_id = yandex_vpc_subnet.subnet1.id
  }

  target {
    address   = module.lamp-server.internal_ip4
    subnet_id = yandex_vpc_subnet.subnet2.id
  }
}

resource "yandex_lb_network_load_balancer" "lb1" {
  name = "web-servers-lb"
  description = "The load balancer of web-servers"
  type = "external"

  listener {
    name = "http-listener"
    port = 80
    external_address_spec {
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = yandex_lb_target_group.acdc.id

    healthcheck {
      name = "http-healthcheck"
      http_options {
        port = 80
      }
    }
  }
}
