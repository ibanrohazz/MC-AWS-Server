#!/bin/bash

MINECRAFTSERVERURL="${server_url}"

# Install Java
sudo yum install -y java-21-amazon-corretto-headless

# Create minecraft user and directories
sudo adduser minecraft
sudo mkdir -p /opt/minecraft/server
sudo chown -R minecraft:minecraft /opt/minecraft

# Download and install server
cd /opt/minecraft/server
sudo -u minecraft wget $MINECRAFTSERVERURL -O server.jar

# Generate eula and start scripts
sudo -u minecraft java -Xmx1300M -Xms1300M -jar server.jar nogui || true
sleep 40
sudo -u minecraft sed -i 's/false/true/' eula.txt
sudo -u minecraft bash -c "cat << 'EOF' > start.sh
#!/bin/bash
java -Xmx1300M -Xms1300M -jar server.jar nogui
EOF"
sudo chmod +x start.sh
sudo -u minecraft bash -c "cat << 'EOF' > stop.sh
#!/bin/bash
kill -9 \$(pgrep -f java)
EOF"
sudo chmod +x stop.sh

# Create systemd service
cat << 'EOF' | sudo tee /etc/systemd/system/minecraft.service
[Unit]
Description=Minecraft Server on start up
Wants=network-online.target
After=network-online.target

[Service]
User=minecraft
WorkingDirectory=/opt/minecraft/server
ExecStart=/opt/minecraft/server/start.sh
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl enable minecraft.service
sudo systemctl start minecraft.service
