#!/bin/bash
# the purpose of this file is to run the ocamlmerlin locate, type-enclosing and occurrences commands 
# on the cases that the commands take the most time on all Irmin repository 
# and make sure to match the json of merlin to that of current-bench, in order to launch benchmarks.
function prbench {
     jq '{"results": [{"name": "'$1'", "metrics": [{"name": "'$2':'$3' '$4' / clock", "value": .timing.clock, "units": "ms"}, {"name": "'$2':'$3' '$4' / typer", "value": .timing.typer, "units": "ms"}, {"name": "'$2':'$3' '$4' / ppx", "value": .timing.ppx, "units": "ms"}, {"name": "'$2':'$3' '$4' / query", "value": .timing.query, "units": "ms"}, {"name": "'$2':'$3' '$4' / pp", "value": .timing.pp, "units": "ms"}]}]}'
}
# function benchgraph {
#      jq '{"results": [{"name": "'$1'", "metrics": ['$2']}]}'
# }

# function metric {
#      jq '{"name": "'$1'", "value": '$2', "units": "ms"}'
# }

function locate {
     sed -n "$2"p "$4"
     printf "%$3s^\n" ' '
     ocamlmerlin single $1 -look-for ml -position $2:$3 -filename $4 < $4 \
     | prbench $1 $2 $3 $5 $6
     # | benchgraph $1 (metric "clock" .timing.clock)
}
locate locate 23 16 ./examples/irmin_git_store.ml examples-irmin_git_store.ml
locate locate 118 21 ./examples/process.ml examples-process.ml 
locate locate 49 20 ./examples/push.ml examples-push.ml 

# function type-enclosing {
#      sed -n "$2"p "$4"
#      printf "%$3s^\n" ' '
#      ocamlmerlin single $1 -position $2:$3 -verbosity 0 < $4 \
#      | prbench $1 $2 $3 $4 $5
# }

# function occurrences {
#      sed -n "$2"p "$4"
#      printf "%$3s^\n" ' '
#      ocamlmerlin single $1 -identifier-at $2:$3 -filename $4 < $4 \
#      | prbench $1 $2 $3 $4 $5
# }

# locate locate 23 16 ./examples/irmin_git_store.ml .timing.query
# locate locate 118 21 ./examples/process.ml .timing.query
# locate locate 49 20 ./examples/push.ml .timing.query
# locate locate 34 16 ./examples/deploy.ml .timing.query
# locate locate 111 9 ./examples/process.ml .timing.query
# locate locate 43 26 ./examples/push.ml .timing.query
# locate locate 70 22 ./test/irmin-graphql/common.ml .timing.query

# locate locate 23 16 ./examples/irmin_git_store.ml 
# locate locate 118 21 ./examples/process.ml 
# locate locate 49 20 ./examples/push.ml 
# locate locate 34 16 ./examples/deploy.ml 
# locate locate 111 9 ./examples/process.ml 
# locate locate 43 26 ./examples/push.ml 
# locate locate 70 22 ./test/irmin-graphql/common.ml 

# type-enclosing type-enclosing 215 13 ./src/irmin/watch.ml .timing.query
# type-enclosing type-enclosing 86 21 ./src/irmin/watch.ml .timing.query
# type-enclosing type-enclosing 95 22 ./src/irmin/watch.ml .timing.query
# type-enclosing type-enclosing 240 43 ./src/irmin/watch.ml .timing.query
# type-enclosing type-enclosing 303 26 ./src/irmin/watch.ml .timing.query
# type-enclosing type-enclosing 317 17 ./src/irmin/watch.ml .timing.query

# occurrences occurrences 40 46 ./src/irmin-mirage/git/irmin_mirage_git.ml .timing.clock
# occurrences occurrences 39 24 ./src/irmin-mirage/git/irmin_mirage_git.ml .timing.clock
# occurrences occurrences 50 18 ./src/irmin-mirage/git/irmin_mirage_git.ml .timing.clock
# occurrences occurrences 49 8 ./src/irmin-mirage/git/irmin_mirage_git.ml .timing.clock
# occurrences occurrences .timing.clock
# occurrences occurrences .timing.clock
# occurrences occurrences .timing.clock

# 25, i : 40 46 ./src/irmin-mirage/git/irmin_mirage_git.ml, word: t 
# 26, i : 39 24 ./src/irmin-mirage/git/irmin_mirage_git.ml, word: Hash 
# 28, i : 50 18 ./src/irmin-mirage/git/irmin_mirage_git.ml, word: Irmin_git 
# 31, i : 49 8 ./src/irmin-mirage/git/irmin_mirage_git.ml, word: Ref 