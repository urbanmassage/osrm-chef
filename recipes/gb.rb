execute 'apt-get -y update'

include_recipe 'osrm::install_git'

Chef::Log.info("About to run osrm_map for GB")

osrm_map 'great-britain' do
  action :create_if_missing
end

Chef::Log.info("About to run osrm_routed for GB")

osrm_routed 'great-britain' do
  user   'osrm-routed'
  listen '0.0.0.0'
  port   5000
end