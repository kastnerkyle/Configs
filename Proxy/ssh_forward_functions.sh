#export DEFAULT_SSH_PROXY_HOST=username@proxyhost

# Another convenient command to forward local requests on 9999 to remote host 9999
# ssh -p 8000 -L 9999:localhost:9999 username@host -nNT

function http_server_init_remote {  
     serve_string="$DEFAULT_SSH_PROXY_HOST"' ssh '"$1"' python -m SimpleHTTPServer '"$2"
     $HOME/ssh_expect.ex $serve_string
}  

function sshft {
    # Thanks to dwf for this
    if [ $# -lt 2 ]; then
        echo "usage: sshft host [port|local:remote|local:bridge:remote] ...]";
        return 1;
    fi;
    if [ -z "$DEFAULT_SSH_PROXY_HOST" ]; then
        echo "No DEFAULT_SSH_PROXY_HOST set.";
        return 1;
    fi;
    FIRST_SSH_ARGS="$DEFAULT_SSH_PROXY_HOST";
    SECOND_SSH_ARGS="$1";
    shift;
    while (( "$#" )); do
        if [[ "$1" =~ ^[0-9]+$ ]]; then
            FIRST_SSH_ARGS="$FIRST_SSH_ARGS -L $1:localhost:$1";
            SECOND_SSH_ARGS="$SECOND_SSH_ARGS -L $1:localhost:$1";
        else
            if [[ "$1" =~ ^[0-9]+:[0-9]+$ ]]; then
                FIRST_PORT=$(echo $1 |cut -d ':' -f 1);
                SECOND_PORT=$(echo $1 |cut -d ':' -f 2);
                FIRST_SSH_ARGS="$FIRST_SSH_ARGS -L $FIRST_PORT:localhost:$FIRST_PORT";
                SECOND_SSH_ARGS="$SECOND_SSH_ARGS -L $FIRST_PORT:localhost:$SECOND_PORT";
            else
                if [[ "$1" =~ ^[0-9]+:[0-9]+:[0-9]+$ ]]; then
                    FIRST_PORT=$(echo $1 |cut -d ':' -f 1);
                    SECOND_PORT=$(echo $1 |cut -d ':' -f 2);
                    THIRD_PORT=$(echo $1 |cut -d ':' -f 3);
                    FIRST_SSH_ARGS="$FIRST_SSH_ARGS -L $FIRST_PORT:localhost:$SECOND_PORT";
                    SECOND_SSH_ARGS="$SECOND_SSH_ARGS -L $SECOND_PORT:localhost:$THIRD_PORT";
                else
                    echo "usage: sshft host [port|local:remote|local:bridge:remote] ...]";
                    return 1;
                fi;
            fi;
        fi;
        shift;
    done;
    echo ssh $FIRST_SSH_ARGS -t ssh $SECOND_SSH_ARGS;
    $HOME/ssh_expect.ex $FIRST_SSH_ARGS -t ssh $SECOND_SSH_ARGS "'while true; do echo "'$RANDOM'"; sleep 2; done'"
}

function killjobs {
    JOBS="$(jobs -p)"
    if [ -n "${JOBS}" ]; then
        kill -KILL ${JOBS};
    fi
}

# Usage: serve_from hostname port
function serve_from {
    # This server will not die on the remote!
    http_server_init_remote $@ &
    sshft $@
    killjobs
}

function http_server_midi_init_remote {  
     serve_string="python server.py -d /u/kastner/src/dagbldr/examples/rnn_midi_lm/samples -p $1"
     $HOME/ssh_forward_expect.ex $serve_string
}  

# Usage: serve_midi port
function serve_midi {
    # This server will not die on the remote!
    http_server_midi_init_remote $1
    killjobs
}