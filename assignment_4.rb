#Custom Exception for empty array
class EmptyArrayError < StandardError
  def message
      "array is empty"
  end
end
​#custom exception for no even number
class NoEvenNumberError < StandardError
  def message
      "no even number"
  end
end
​def even_numbers(array)
  begin
      raise TypeError if array.class != Array
      raise EmptyArrayError if array.empty?
      raise NoEvenNumberError if no_even_number_present? array      
    rescue EmptyArrayError =>  exception
      print_error exception
    rescue NoEvenNumberError =>  exception
      print_error exception
      
  rescue TypeError =>  exception
      print_error exception
  end
​end
​def no_even_number_present?(array)
  array.select {|i| i.even?}.size == 0 ? true : false
end
​def print_error(exception)
  p "#{exception.class} : #{exception.message}" 
end
​#not an array
even_numbers("some_string")
​
#empty array
even_numbers([])
​
#no even number
even_numbers([1,3])














