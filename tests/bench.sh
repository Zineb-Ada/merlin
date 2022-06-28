#!/bin/bash
# the purpose of this file is to run the ocamlmerlin locate, type-enclosing and occurrences commands 
# on the cases that the commands take the most time on all Irmin repository 
# and make sure to match the json of merlin to that of current-bench, in order to launch benchmarks.
function prbench {
     jq '{"results": [{"name": "'$1'", "metrics": [{"name": "'$2':'$3' '$4'", "value": .timing.query, "units": "ms"}]}]}'
}

function locate {
     sed -n "$2"p "$4"
     printf "%$3s^\n" ' '
     ocamlmerlin single $1 -look-for ml -position $2:$3 -filename $4 < $4 \
     | prbench $1 $2 $3 $4
}

function type-enclosing {
     sed -n "$2"p "$4"
     printf "%$3s^\n" ' '
     ocamlmerlin single $1 -position $2:$3 -verbosity 0 < $4 \
     | prbench $1 $2 $3 $4
}

# function occurrences {
#      sed -n "$2"p "$4"
#      printf "%$3s^\n" ' '
#      ocamlmerlin single $1 -identifier-at $2:$3 -filename $4 < $4 \
#      | prbench $1 $2 $3 $4
# }

locate locate 23 16 ./examples/irmin_git_store.ml 
locate locate 118 21 ./examples/process.ml 
locate locate 49 20 ./examples/push.ml 
locate locate 34 16 ./examples/deploy.ml 
locate locate 111 9 ./examples/process.ml 
locate locate 43 26 ./examples/push.ml 
locate locate 70 22 ./test/irmin-graphql/common.ml 

type-enclosing type-enclosing 215 13 ./src/irmin/watch.ml 
type-enclosing type-enclosing 86 21 ./src/irmin/watch.ml 
type-enclosing type-enclosing 95 22 ./src/irmin/watch.ml 
type-enclosing type-enclosing 240 43 ./src/irmin/watch.ml 
type-enclosing type-enclosing 303 26 ./src/irmin/watch.ml 
type-enclosing type-enclosing 317 17 ./src/irmin/watch.ml 

# occurrences occurrences 
# occurrences occurrences
# occurrences occurrences
# occurrences occurrences
# occurrences occurrences
# occurrences occurrences
# occurrences occurrences
