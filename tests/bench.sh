#!/bin/bash
function locate {
     sed -n "$1"p "$3"
     ocamlmerlin single locate -look-for ml -position $1:$2 -filename $3 < $3 \
     | jq '{"results": [{"name": "locate", "metrics": [{"name": "'$1':'$2' '$3'", "value": .timing.query, "units": "ms"}]}]}'
}
function type_enclosing {
     sed -n "$1"p "$3"
     ocamlmerlin single type-enclosing -position $1:$2 -verbosity 0 < $3 \
     | jq '{"results": [{"name": "type_enclosing", "metrics": [{"name": "'$1':'$2' '$3'", "value": .timing.query, "units": "ms"}]}]}'
}

locate 23 16 ./examples/irmin_git_store.ml
locate 118 21 ./examples/process.ml
locate 49 20 ./examples/push.ml
locate 34 16 ./examples/deploy.ml
locate 111 9 ./examples/process.ml
locate 43 26 ./examples/push.ml
locate 70 22 ./test/irmin-graphql/common.ml

type_enclosing 95 9 ./src/irmin/watch.ml
type_enclosing 96 3 ./src/irmin/watch.ml
type_enclosing 215 13 ./src/irmin/watch.ml
type_enclosing 86 21 ./src/irmin/watch.ml
type_enclosing 95 22 ./src/irmin/watch.ml
type_enclosing 207 38 ./src/irmin/watch.ml
type_enclosing 236 36 ./src/irmin/watch.ml
type_enclosing 240 43 ./src/irmin/watch.ml
type_enclosing 303 26 ./src/irmin/watch.ml
type_enclosing 317 17 ./src/irmin/watch.ml
