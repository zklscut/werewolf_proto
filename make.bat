@echo off
call script/build
echo make finish!

erl -pa ebin -s conver_proto_to_b start
pause