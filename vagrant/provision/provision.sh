#!/bin/sh

cp /vagrant/provision/apt/contrib.list /etc/apt/sources.list.d/
cp /vagrant/provision/apt/sonar.list /etc/apt/sources.list.d/

echo "Mise a jour apt-get update"
apt-get update >/dev/null
echo "Mise a jour apt-get update --> OK"

echo "Installation java jdk"
apt-get install openjdk-7-jdk -y >/dev/null
echo "Installation java jdk --> OK"

echo "Installation sonar"
apt-get install sonar -y --force-yes >/dev/null
cp /vagrant/provision/sonar/sonar-php-plugin-2.8.jar /opt/sonar/extensions/plugins/
echo "Installation sonar --> OK"

echo "Installation runner sonar"
mkdir /home/vagrant/tmp
cd /home/vagrant/tmp/
wget https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-2.5.1.zip
unzip sonar-scanner-2.5.1.zip
cp -r sonar-scanner-2.5.1/ /opt
cd /home/vagrant/
rm -rf tmp/
echo "Installation runner sonar --> OK"

echo "Starting sonar"
/etc/init.d/sonar start
echo "Starting sonar --> OK"
