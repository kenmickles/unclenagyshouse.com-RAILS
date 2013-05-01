#!/bin/bash
rake assets:clean
rake assets:precompile
rails server -e production &
pid=$!
sleep 5
cd /tmp && wget -m localhost:3000
rsync -rtvu --delete "/tmp/localhost:3000/" 37i:~/www/new.unclenagyshouse.com
kill -9 $pid