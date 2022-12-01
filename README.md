## TORC Challenge 

This project is the Take Home Project Challenge given by TORC. 


It was not allowed to used any external libraries except for tests libraries, and it was choosed.
Rspec, how can be comfirmed in the Gemfile.  
The time limit to build the solution was 4 hours.

### Input and Output methods

The mechanism for feeding the input was of free choice.
It was decided for using JSON.

The output of the main method is also a JSON.

### Running the tests 

All of the provided inputs/outputs are included in the unit tests.  
It can be executed with the following command:

`bundle exec rspec ./spec/store_spec.rb --format documentation`

### Running the project

You can run the script and print a sample input by running the following command: 

`ruby ./store_print_example.rb`

#### Running the project with different inputs

As mentioned before, the time to build the solution was limited.  
To test new inputs, you must change the `products` array in the file `store_print_example.rb` and execute:

`ruby ./store_print_example.rb`
