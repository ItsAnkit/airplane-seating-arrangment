# AirplaneSeatingArrangement

• It helps seat audiences in a flight based on the following input and rules.
Rules for seating

• Always seat passengers starting from the front row to back, starting from the left to the right

• Fill aisle seats first followed by window seats followed by center seats (any order in center seats)

Input to the program will be

• a 2D array that represents the rows and columns [ [3,4], [4,5], [2,3], [3,4] ]

• Number of passengers waiting in queue.


For installing ruby, follow this doc https://www.ruby-lang.org/en/documentation/installation/

and after successful installation run code as:

    ruby lib/airplane_seating_arrangement.rb

After this, you will be asked following questions:

Enter seating structure for flight
[ [3,2], [4,3], [2,3], [3,4] ]

Enter no. of passengers waiting in queue:
30

Based on data entered, it will display seating arrangement.

For running the tests provided, you will need the Rspec gem. Open a
terminal window and run the following command to install rspec:

    gem install rspec


In order to run the test, you can run the test file from the spec
directory. For example, if the test suite is called
`airplane_seating_arrangement_spec.rb`, you can run the following command:

    rspec  spec/airplane_seating_arrangement_spec.rb
