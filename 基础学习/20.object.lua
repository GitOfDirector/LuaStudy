--table function
--对于一个对象来说 属性 方法
person = { name = "david", age = 18, 
			play = function ()
				print("玩")
			end
}

person.eat = function (self)
	print(self.name.."---吃")
end

function person.drink () 
	print("喝")
end

function person : happy () 
	print(self.name.."***乐")
end

a = person
--person = nil

a.eat(a)
a:eat()
a:happy()--通过 ：调用方法的时候，self会自动赋值为当前调用的表

function person:new()
	local item = {}
	setmetatable(item, {__index = self})--如果调用一个属性的时候，如果不存在，则在所指定的table中查找	
	return item
end

b = person:new()
print(b.name)

student = person:new()
student.grade = 1

stu1 = student:new()

print(stu1.name);


















































