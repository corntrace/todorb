#!/bin/sh
test_description="Testing out pri_sort "
. ./test-lib.sh


cat > TODO2.txt <<CATEOF
  1	[x] if no TODO file give proper message to add task (2010-06-14)
  2	[x] what if no serial_number file? (2010-06-14)
  3	[x] Add a close for status close (2010-06-14)
    3.1	[ ] hello there new a u 3 (2010-06-15)
        3.1.1	[ ] hello there new a u 3 (2010-06-15)
        3.1.2	[ ] hello there new a u 3 (2010-06-15)
        3.1.3	[ ] hello there new a u 3 (2010-06-15)
    3.2	[ ] hello there new a u 3.2 (2010-06-15)
        3.2.1	[ ] hello there new a u 3.2.1 (2010-06-15)
            3.2.1.1	[ ] hello there new a u 3.2.1.1 (2010-06-15)
  4	[ ] start rubyforge project for todorb (2010-06-14)
  5	[ ] list: if dir given then show full path of TODO2.txt at end (2010-06-14)
  6	[ ] allow for ENV VARS such as verbose, plain, force (2010-06-15)
  7	[ ] list: search terms with - + and = (2010-06-15)
CATEOF

test_todo_session "Testing of pri_sort" <<EOF
>>> todorb pri 4 6 B
   4 : [ ] start rubyforge project for todorb (2010-06-14) 
 [32m  4 : [ ] (B) start rubyforge project for todorb (2010-06-14) [0m
   6 : [ ] allow for ENV VARS such as verbose, plain, force (2010-06-15) 
 [32m  6 : [ ] (B) allow for ENV VARS such as verbose, plain, force (2010-06-15) [0m
Changed priority of 2 task/s
>>> end
>>> todorb pri 5 7 A
   5 : [ ] list: if dir given then show full path of TODO2.txt at end (2010-06-14) 
 [32m  5 : [ ] (A) list: if dir given then show full path of TODO2.txt at end (2010-06-14) [0m
   7 : [ ] list: search terms with - + and = (2010-06-15) 
 [32m  7 : [ ] (A) list: search terms with - + and = (2010-06-15) [0m
Changed priority of 2 task/s
>>> end
>>> todorb list --sort
     3.1 [ ] hello there new a u 3 (2010-06-15) 
         3.1.1 [ ] hello there new a u 3 (2010-06-15) 
         3.1.2 [ ] hello there new a u 3 (2010-06-15) 
         3.1.3 [ ] hello there new a u 3 (2010-06-15) 
     3.2 [ ] hello there new a u 3.2 (2010-06-15) 
         3.2.1 [ ] hello there new a u 3.2.1 (2010-06-15) 
             3.2.1.1 [ ] hello there new a u 3.2.1.1 (2010-06-15) 
[37m[1m   4 [ ] (B) start rubyforge project for todorb (2010-06-14) [0m
[37m[1m   6 [ ] (B) allow for ENV VARS such as verbose, plain, force (2010-06-15) [0m
[33m[1m   7 [ ] (A) list: search terms with - + and = (2010-06-15) [0m
[33m[1m   5 [ ] (A) list: if dir given then show full path of TODO2.txt at end (2010-06-14) [0m
 
 11 of 14 rows displayed from TODO2.txt 
>>> end

EOF
test_done
