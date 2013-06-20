Vagrant::Config.run do |config|

  # name of vagrant box
  config.vm.box = "django_app_server"

  # forward guest port 8080 to host port 8080 for gunicorn HTTP server
  config.vm.forward_port 8080, 8080

  # update apt on debian systems
  #config.vm.provision :shell, :inline => 'which apt-get && apt-get -y update'		# comment out to speed up reloads

  # upgrade chef to latest known 0.10
  config.vm.provision :shell, :inline => 'gem list | grep chef | grep 10.24.0 || gem install chef -v 10.24.0 --no-rdoc --no-ri'
  
  # chef-solo provisioning
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = 'cookbooks'
    chef.json.merge!(JSON.parse(File.read('node.json')))
    chef.run_list = JSON.parse(File.read('node.json'))['run_list']
    #chef.run_list = []
    chef.log_level = :debug
  end

end