Contact Manager [![Code Climate](https://codeclimate.com/github/hale/coding_exercise.png)](https://codeclimate.com/github/hale/coding_exercise) [![Code Climate](https://codeclimate.com/github/hale/coding_exercise/coverage.png)](https://travis-ci.org/hale/coding_exercise)
=====

## Specification

The Project
------------
This is a straight forward contact management exercise. Allow a user to enter a person's 
details, alerting them to when there is someone with the same details (so they don't 
re-enter a contact) or if there are similar people (and can be grouped by household).

In any exercise like this, you will probably have to make some assumptions or need clarity 
on some points. You have two equally valid choices. First, try to raise me on skype, email 
or text, and I will answer you as quick as I can (but no guarantees). Second, make 
assumptions based on your experience or general knowledge. Either approach is fine. 
If you choose the latter, be sure to document your assumptions.

At a minimum, complete steps 1-3. I'd prefer to see steps 1-3 completed and 
working than see only the first step completed with an amazing design/UX. If you want 
to demonstrate design skills, apply them to step 4 and/or 5. 

**1. Enter a new contact (this is a simplified format for US contacts)**

    contact [validation: name completed; zero or more addresses; zero or more phone; at least one phone or address]
        name [cross-field validation: all fields completed]
            first name [validation - any alphabetical characters]
            last name [validation - any alphabetical characters]
        address [cross-field validation: none]
            street_address (allow for 2 lines) [validation - any numeric or alphabetical characters, separated by spaces]
            city [validation - any alphabetical characters]
            state [validation - any of the 2 letter abbreviations OR any of the spelled out 50 US states]
            zip code [validatio  - ##### (5 numbers)]
        phone [cross-field only one primary number]
            number [validation - ###-###-#### (10 numbers)]
            primary [validation- boolean; first one entered defaults to true; others default to false;

**2.  When entering a contact, try to match against any existing contacts if a match is found, allow the user to select that contact if a match is found, allow the user to edit those details if a match is found, allow the user to add missing details**

**3.  Allow search for contacts by field, allowing for wild card searches e.g.  search for everyone with a first name of jack or jason by searching 'ja'**

**4.  When entering a contact and a partial match is found, allow the user to 'household' 2+ contacts.**

**5.  When searching for contacts and multiple results are found, allow the user to 'household' 2+ contacts.**

------------------------

## Implementation

Specification complete up to householding. Mocks for householding contacts from search results can be viewed [here as a PDF](https://www.dropbox.com/s/ly9bo215kieax7m/contact_management_householding_mocks.pdf).

### Features

1. Enter a new contact, validations for US formats
    - name
    - address
    - phone number(s)
2. Contact matching
    - autocomplete on first and last name for existing contacts
    - select autocomplete entry to edit that contact
3. Partial matches
    - "ja" will give results for "Janet" and "Jake"
4. Search page
    - Choose any combination of fields to search on
    - Partial matches on all fields.


### Current Limitations:

* Cannot pick which number is primary.
* Match contacts applied to first name and last name only.
* No Householding.

### Assumptions

* It’s okay to split street\_address into two fields for each line
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
