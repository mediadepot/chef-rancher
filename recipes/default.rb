#
# Cookbook Name:: docker-rancher
# Recipe:: default
#
# Copyright (C) 2015 Jason Kulatunga
#
# MIT
#

# start the docker service
docker_service 'default' do
  action [:create, :start]
end

docker_rancher 'depot_rancher_server' do
  settings({
    'catalog.url' => 'https://github.com/prachidamle/rancher-catalog.git'
  })
end

docker_rancher_agent 'depot_rancher_agent' do
  manager_ipaddress node['ipaddress']
  single_node_mode true
end
