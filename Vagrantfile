Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/trusty64"
    config.vm.network :forwarded_port, host: 8080, guest: 80

    config.vm.synced_folder "./", "/vagrant", :owner => "www-data", :mount_options => [ "dmode=775", "fmode=774" ]

    config.vm.provision "shell", inline: <<-SHELL
        sudo apt-get -y update

        # MySQL Fix
        echo mysql-server-5.5 mysql-server/root_password password vagrant | debconf-set-selections
        echo mysql-server-5.5 mysql-server/root_password_again password vagrant | debconf-set-selections

        # Install Dependencies
        apt-get install -y apache2
        apt-get install -y mysql-common mysql-server mysql-client
        apt-get install -y php5 php5-cli php5-common php5-dev php5-mysql php5-curl php5-gd php5-fpm libapache2-mod-php5

        # Serve Vagrant Folder
        sudo rm -rf /var/www/html
        sudo ln -s /vagrant /var/www/html

        # Create Wordpress Database
        /usr/bin/mysql -u root -pvagrant --execute=\'CREATE DATABASE wordpress\'
        /usr/bin/mysql -u root -pvagrant --execute="GRANT ALL PRIVILEGES ON wordpress.* TO \'wordpress\'@\'localhost\' IDENTIFIED BY \'wordpress\'"

        # Restart the Server
        sudo service apache2 restart
    SHELL
end
