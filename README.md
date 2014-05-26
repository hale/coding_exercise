Contact Manager [![Code Climate](https://codeclimate.com/github/hale/coding_exercise.png)](https://codeclimate.com/github/hale/coding_exercise) [![Code Climate](https://codeclimate.com/github/hale/coding_exercise/coverage.png)](https://travis-ci.org/hale/coding_exercise)
=====

### Features

1. Enter a new contact, validations for US formats
    - name
    - address
    - phone number(s)
2. Contact matching
    - autocomplete on first and last name for existing contacts
    - select autocomplete entry to edit that contact
3. Partial matches
    - “ja” will give results for “Janet” and “Jake”
4. Search page
    - Choose any combination of fields to search on
    - Partial matches for name


### Current Limitations:

* Cannot pick which number is primary.
* Currently only trys to match contacts on first name and last name.
* Search engine has high recall and low precision, may need fine-tuning to improve precision. (I.e. picking a better sensitivity value for trigram search).
* No Householding

### Assumptions

* It’s okay to split street_address into two fields for each line
* First name and second name can be two fields
* People might use non-english characters for their name. E.g. accented characters.
* Strict validation on phone number. For better UX some javascript can be added to try and coerce common number formats into ###-###-####
* Phone numbers can’t exist without associated contacts
* Phone numbers are not shared between contacts, they are unique on each contact.
* Address *may* be shared between contacts, for householding.
* All fields are shorter than 255 characters.

### Technology / library choices

* Foundation for basic styles
* Rails for good validation support, available libraries, familiarity
* Rails 4.0 because 4.1 has some issues with PgSearch
* PgSearch - use database search for simplicity over a dedicated index
* Ruby 2.1 - required keyword arguments, latest stable ruby
* Rspec, capybara, factorygirl, flexmock, guard - testing environment
* Foreigner to add foreign key constraints, less database corruption long term
* Typeahead for instant matches when creating / editing contacts.
* Faker for realistic seed data
* PostgreSQL, for the built in search
