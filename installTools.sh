#!/bin/bash

sudo apt install docker.io -y
sudo apt install containerd.io -y
sudo apt install remmina -y
sudo apt install openvswitch -y
sudo bash -c "$(curl -sL https://get.containerlab.dev)"
