# Night Writer 
* This program translates english characters to braille, and braille characters back to english. It uses a dictionary of lowercase english characters and punctuation set to the braille equivalent. 

* To translate from english to braille, write on the command line in your terminal: 

###### ruby night_writer_runner.rb message.txt braille.txt

#### There is already a message inside of message.txt. 

* To translate from braille to english, write on the command line in your terminal: 

###### ruby night_reader_runner.rb braille.txt original.txt

* The message inside message.txt is currently 147 characters, this will demonstrate that the translation to braille adds a new line after 80 characters.

## Self Assessment 

### Functionality and Object Oriented Programming

* I would give myself a meets expectations for functionality. I did not incorporate a class or module. I wanted to, however, I got to a point where I was satisfied enough with my program. If I had more time, I would like to add a module to use between the night reader and night writer classes. That module could potentially be the translator or the dictionary.

* For OOP, I did separate out my classes in a way that made sense to me. The translator is the bulk of the program, which translates english to braille and braille to english. Night writer and reader are small and just call the methods to translate the message. File hub handles all of the file IO. I though about putting some of the methods in the file  hub, into each reader and writer class. However, it made sense to me to have the file behavior all in once place.

### Ruby Convention and Mechanics 

* I would give myself a meets expectations for this section of the rubric. I implemented two hashes in the dictionary and tried to make my method and variable names clear. I used the map enumerable in a lot of place to manipulate the arrays holding braille and english characters. I would like to find other enumerables to handle those. There were a couple places that felt like I was doing more than needed. For example, I struggled with adding a new line after 80 characters. I feel like there is a more simple solution that what I did to add the new line.

### Test driven development

* I would give myself a meets expectations for TDD. I made sure to write out my tests first, and tried to test multiple things about the method if possible. My simplecov is at 100%. I would have liked to try a mock/stub for file IO, but could not figure out how to do that without using a fixture.

### Version control 

* I would give myself a meets expectations/above expectations for version control. I commit frequently and did more than 4 pull requests.