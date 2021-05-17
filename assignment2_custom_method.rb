class String
    def my_split(del=" ",&b)
        arr=[]
        if del.length==0
            del=" "
        end
        j=0
        str= " " 
        self.each_char.with_index do |item,i|
            if(item==del)
                arr << self[j..i-1]
                yield self[j..i-1] if block_given?
                j=i+1
            end
            if(i==self.length-1)
                arr<<self[j..self.length-1]
                yield self[j..self.length-1] if block_given?
                break
            end   
        end
        return arr
    end
end


s = "Medidata"
p s.my_split
s = "M e d i d a t a" 
p s.my_split(" ")
s = "Medi * data"
p s.my_split("*")
s="M e d i d a t a"
p s.my_split {|i| p i.upcase }


