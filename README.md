```
cargo build
export LUA_CPATH=../target/debug/lib?.dylib
#export LUA_CPATH=../target/debug/lib?.so
cd cartridge
cartridge build && cartridge start
cartridge replicasets setup --bootstrap-vshard
```
