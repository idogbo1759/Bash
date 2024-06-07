#!/bin/bash

#Change Host Name to Jenkins
sudo hostnamectl set-hostname Jenkins
#Perform update first
# Start the first installation process in the background
sudo apt update &

# Store the PID of the first installation process
pid_1=$!

# Wait for the first installation process to finish
wait $pid_1

# Proceed with the next commands after the first installation process is complete
echo "Application Update process completed. Proceeding to the next step."

#Install Java 11
# Start the second installation process in the background
sudo apt install default-jdk -y &

# Store the PID of the second installation process
pid_2=$!

# Wait for the second installation process to finish
wait $pid_2

# Proceed with any subsequent commands after the second installation process is complete
echo "Java installation process completed. Proceeding to the next step."

# Maven Installation, Start the first installation process in the background
sudo apt install maven -y &

# Store the PID of the first installation process
pid_3=$!

# Wait for the first installation process to finish
wait $pid_3

# Proceed with the next commands after the first installation process is complete
echo "Maven installation process completed. Proceeding to the next step."

# Start the first installation process in the background
curl -fsSL https://pkg.jenkins.io/debian/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null &

# Store the PID of the first installation process
pid_4=$!

# Wait for the first installation process to finish
wait $pid_4

# Proceed with the next commands after the first installation process is complete
echo "Repository key has been added to the system. Proceeding to the next step."
# Start the first installation process in the background
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt update &

# Store the PID of the first installation process
pid_5=$!

# Wait for the first installation process to finish
wait $pid_5

# Proceed with the next commands after the first installation process is complete
echo "Application Update process completed. Proceeding to the next step."
# Start the first installation process in the background
sudo apt install jenkins -y &

# Store the PID of the first installation process
pid_6=$!
# Wait for the first installation process to finish
wait $pid_6
# Proceed with the next commands after the first installation process is complete
echo "Jenkins installation process completed. Proceeding to the next step."
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
# Continue with additional commands as needed...
