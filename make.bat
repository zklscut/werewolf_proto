@echo off
call script/build
echo make finish!

erl -pa ebin -s conver_proto_to_b start

copy /y game_pb.erl D:\project\werewolf\server\branches\werewolf\src\net
copy /y game_pb.hrl D:\project\werewolf\server\branches\werewolf\include
copy /y b_proto_route.erl D:\project\werewolf\server\branches\werewolf\src\data

pause