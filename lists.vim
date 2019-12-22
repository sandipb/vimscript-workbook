" Vim lists can have mixed types
echo ['mary', 'had', 3, 'lambs']

" Lists can be nested
echo ["children", ["anil", "anamika"]]

" Lists are zero indexed
echo ["one", "two", "three"][1]
" => two

" Negative indexes count from the end
echo ["one", "two", "three"][-1]
" => three

" Lists can be sliced, but end is *inclusive*!
echo ["one", "two", "three", "four"][1:2]
" => ['two', 'three']

" Vim forgives going beyond end of array
echo ["one", "two", "three", "four"][3:2000]
" => ['four']

" Slices can have negative indexes
echo ["one", "two", "three", "four"][-3:-1]
" ['two', 'three', 'four']

" Slice start and end can be left off, and be filled by 0 and end of list
" respectively
echo ["one", "two", "three", "four"][:-2]
" => ['one', 'two', 'three']

echo ["one", "two", "three", "four"][-3:]
" => ['two', 'three', 'four']

" You can slice strings too
echo "Hello"[1:]
" => ello

" Strings don't index with negative numbers
echo "hello"[-1]
" =>

" ... but slice indexes can be negative
echo "hello"[-2:]
" => lo

" Lists can be concateneted

echo ['one', 'two', 'three'] + ['four']
" => ['one', 'two', 'three', 'four']

" LIST FUNCTIONS

" add() appends argument to existing list
let name = ['Jane'] | call add(name, 'Doe') | echo name
" => ['Jane', 'Doe']

" len() gives you length of array
echo len(name)
" => 2

" get() gets you element at index, with a default if index exceeds bounds
echo get(name, 1, "Unnamed")
" => Doe

echo get(name, 2, "Unnamed")
" => Unnamed

" index() gets you position of element in list, or -1 if not available
echo index(name, "Jane")
" => 0

echo index(name, "John")
" => -1

" join(list, separator=' ') joins list into string. Will coerce to string if
" necessary
echo join(["beautiful", "day"])
" => beautiful day

echo join(["beautiful", "day"], ",")
" => beautiful,day

echo join([1, 2, 3])
" => 1 2 3

echo reverse([1, 2, 3])
" => [3, 2, 1]

" BEWARE: Any list passed will be reversed in place!
let nums = [1, 2, 3] | echo reverse(nums) | echo nums
" => [3, 2, 1]
" => [3, 2, 1]
