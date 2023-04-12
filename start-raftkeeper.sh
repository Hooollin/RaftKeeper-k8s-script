(cd $RAFTKEEPER_DIR/bin/ && python3 config_processor.py "$@")
if [ $? != 0 ]; then exit $?; fi

cat $RAFTKEEPER_DIR/conf/config.xml

echo -e "\n"

(cd $RAFTKEEPER_DIR/ && ./lib/raftkeeper server --config=conf/config.xml)

sleep 5

$log_file="$RAFTKEEPER_DIR/log/raftkeeper.log"

if [ ! -f "$logfile" ]; then
  tail -f /dev/null
else
  (cd $RAFTKEEPER_DIR/ && tail -f /log/raftkeeper.log)
fi
