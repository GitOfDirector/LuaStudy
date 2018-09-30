--[[
--io.xxx 文件操作函数
file = io.open("data.txt", "r")
io.input(file)
print(io.read())
io.close(file)
file = io.open("data.txt", "a")
io.output(file)
io.write("\n")
io.write("澳门日本")
io.close(file)
file = io.open("data.txt", "r")
io.input(file)
print(io.read("*n"))
io.close(file)]]
--完全模式

file = io.open("data.txt", "a+")
print(file : read())
--file : close()
file : write("yangfasdfjfing")
file : flush()
file : close()



























