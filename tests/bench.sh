#!/bin/bash
function locate {
     sed -n "$1"p "$3"
     printf "%$2s^\n" ' '
     ocamlmerlin single locate -look-for ml -position $1:$2 -filename $3 < $3 \
     | jq '{"results": [{"name": "locate", "metrics": [{"name": "'$1':'$2' '$3'", "value": .timing.query, "units": "ms"}]}]}'
}

locate 23 16 ./examples/irmin_git_store.ml
locate 118 21 ./examples/process.ml
locate 49 20 ./examples/push.ml
locate 34 16 ./examples/deploy.ml
locate 111 9 ./examples/process.ml
locate 43 26 ./examples/push.ml
locate 70 22 ./test/irmin-graphql/common.ml