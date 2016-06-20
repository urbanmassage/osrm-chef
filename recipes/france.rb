execute 'apt-get -y update'
execute 'apt-get -y install build-essential git cmake pkg-config libprotoc-dev libprotobuf8 protobuf-compiler libprotobuf-dev libosmpbf-dev libpng12-dev libbz2-dev libstxxl-dev libstxxl-doc libstxxl1 libxml2-dev libzip-dev libboost-all-dev lua5.1 liblua5.1-0-dev libluabind-dev libluajit-5.1-dev libtbb-dev'

include_recipe 'osrm::install_git'

Chef::Log.info("About to run osrm_map for france")

osrm_map 'france' do
  action :create_if_missing
end

Chef::Log.info("About to run osrm_routed for france")

osrm_routed 'france' do
  user   'osrm-routed'
  listen '0.0.0.0'
  port   5000
end
