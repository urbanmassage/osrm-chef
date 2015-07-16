execute 'apt-get -y update'
execute 'apt-get -y install git libboost-dev gcc g++ make cmake libstxxl-dev libxml2-dev libbz2-dev zlib1g-dev libzip-dev libboost-filesystem-dev libboost-thread-dev libboost-system-dev libboost-regex-dev libboost-program-options-dev libboost-iostreams-dev libgomp1 libpng-dev libprotoc7 libprotobuf-dev protobuf-compiler liblua5.1-0-dev libluabind-dev pkg-config libosmpbf-dev libtbb-dev libboost-test-dev'

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