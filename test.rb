require_relative 'my_enumerable' # Include this line to load MyEnumerable first
require_relative 'my_list' # Then load MyList which uses MyEnumerable

# Create our list
list = MyList.new(1, 2, 3, 4)

# Test #all?
puts(list.all? { |e| e < 5 }) # should print "true"
puts(list.all? { |e| e > 5 }) # should print "false"

# Test #any?
puts(list.any? { |e| e == 2 }) # should print "true"
puts(list.any? { |e| e == 5 }) # should print "false"

# Test #filter
puts list.filter(&:even?) # should print "[2, 4]"
