#!/usr/bin/bash
cd /var/RaftKeeper/bin/
python3 config_processor.py
cat ../conf/config.xml
bash ./start.sh
