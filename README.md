# Volunteer Tracker

#### _Project in Ruby_

#### Snow Vilay

## Description

_A Ruby Web App_

## Setup/Installation Requirements

_You can view this app online [here](). To set up on your own machine, follow the steps below:_

* Clone this repository
* From the root directory, run ```ruby app.rb```
* Navigate to ```localhost:4567``` in your web browser.

## Specifications

* check for no data in database.
  * Example input: Project.all()
  * Example output: []
* check to save into database
  * Example input: project_list[0].id
  * Example output: save_test.id
* find the project by volunteer
  * Example input: Project.find_project("Michael Jordan")
  * Example output: [save_test3]
* it is the same name if it has the same name
  * Example input: name1
  * Example output: name2
* sets its ID when you save it
  * Example input: Project.all()
  * Example output: [project]
* Words class doesn't allow saving a words object that has already been saved.
  * Example input: cat.save
  * Example output: "Cat is already defined."
* Words class can find a word by word.
  * Example input: Contact.find("dog")
  * Example output: dog definitions
* Words class returns "Can't find word" when word name is not in list.
  * Example input: Contact.find("apple")
  * Example output: "Can't find word"
* Words class can clear word list.
  * Example input: Words.clear_all
  * Example output: Words.all = {}
* User can delete a word object from the word list
  * Example input: dog.delete
  * Example output: Words.find(dog) = "Can't find contact"

## Support and contact details

_Please contact [nv781@yahoo.com]() with questions, comments, or issues._

## Technologies Used

* Ruby

### License

Copyright (c) 2017 **Snow Vilay**

*This software is licensed under the MIT license.*
