class Person
    attr_accessor :name, :age, :gender
    def method_missing(method_name, *args, &block)
        if method_name.to_s =~ /^set_(.*)$/ 
            self.method($1).call(args[0])
        end
        if method_name.to_s =~ /^get_(.*)$/
            self.method($1).call()
        end
    end
end

p= Person.new
p.name = "chris"
p.age = 35
p p.name #chris
p p.age #35
p.set_name = "Adam"
p.set_age = 36
p p.name #Adam
p p.age #36
p p.get_name
p p.get_age
