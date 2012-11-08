#!/bin/bash
#cd /home/rails/www/three-elements/current && bundle exec unicorn -c /home/rails/www/three-elements/current/config/unicorn.rb -E production -D
#cd /home/rails/www/ansever/current && bundle exec rake RAILS_ENV=production ts:rebuild

DIR=$HOME/www
array=(`ls "$DIR"`)

for i in "${array[@]}"
do
  echo "[Starting]: $i"
  cd $DIR/$i/current # && bundle install && 
  bundle exec unicorn -c $DIR/$i/current/config/unicorn.rb -E production -D
  if [ `cat Gemfile.lock|grep thinking-sphinx| wc -l` -ge 1 ];
    then
      echo "rebuilding sphinx" && bundle exec rake RAILS_ENV=production ts:rebuild
    else
      echo "sphinx not found"
  fi
  if [ `cat Gemfile.lock|grep delayed_job| wc -l` -ge 1 ];
    then
      echo "restarting delayed_job" && RAILS_ENV=production script/delayed_job restart
    else
      echo "delayed_job not found"
  fi
done


