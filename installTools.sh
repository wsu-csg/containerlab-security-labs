#!/bin/bash

sudo apt install docker.io -y
sudo apt install openvswitch -y
sudo bash -c "$(curl -sL https://get.containerlab.dev)"
