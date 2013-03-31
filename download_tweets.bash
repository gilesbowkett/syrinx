# this bash script downloads the most recent tweets in my timeline, with
# a maximum of 1000, and keeps track of the most recent tweet it's seen.

set -e

function get_old_since_id() {
  cat .since_id
}

function download_tweets() {
  t timeline -c -n 1000 -s $(get_old_since_id) > since.csv
}

function get_new_since_id() {
  head -2 since.csv | tail -1 | cut -d ',' -f 1
}

function write_new_since_id() {
  echo $(get_new_since_id) > .since_id
}

download_tweets
write_new_since_id

