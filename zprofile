export GOROOT=/opt/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:~/go/bin
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.bin:$PATH"
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

export TERM="xterm-256color"
export NODEJS_HOME="/usr/lib/nodejs/node-v9.0.0"
export PATH=$NODEJS_HOME/bin:$PATH
