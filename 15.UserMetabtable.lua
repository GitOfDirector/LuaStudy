--[[mytable = {"Lua", "C#"}

mymetatable ={
	__index = function(tab, key)
	end
 }

 print(mytable[1])
 --]]
 mytable = {"Lua", "C#"}
 mymetatable = {
 	__add = function (tab, newtab)
 		local mi = 0
 		for k,v in pairs(tab) do
 			if(k > mi) then
 				mi = k
 			end
 		end
 		for k,v in pairs(newtab) do
 			mi = mi + 1
 			table.insert(tab, mi, v)
 		end
 	end,
 	__call = function (tab, arg)
 		print(arg)
 		return "siki"
 	end,
 	__tostring = function (tab)
 		local str = ""
 		for k,v in pairs(tab) do
 			str = str..(k..v).."\n"
 		end
 		return str
 	end

} 

mytable = setmetatable(mytable, mymetatable)
--[[newtab = {"PHP", "Python"}

v = mytable + newtab

for k,v in pairs(mytable) do
	print(k,v)
end--]]

--v = mytable()
--print(v)
print(mytable)


