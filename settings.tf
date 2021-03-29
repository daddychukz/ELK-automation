# ELK nodes to provision
locals {
  nodes = ["elasticsearch", "elastic-node01", "elastic-node02", "logstash", "kibana"]
}

