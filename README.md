## Acceptance test

**Requirements**

- Automate the below acceptance test
- Use the site QAWorks.com

```
Feature: Contact Us Page  
As an end user  
I want a contact us page  
So that I can find out more about QAWorks exciting services!!  

Scenario: Valid Submission 
Given I am on the QAWorks Site    
Then I should be able to contact QAWorks with the following information      
| name    | j.Bloggs                                  |      
| email   | j.Bloggs@qaworks.com                      |
| subject | test automation                           |      
| message | please contact me I want to find out more |
```
### Instructions

To start with, install Homebrew is package manager for Macs and Xcode:

- [x][Homebrew](https://brew.sh/)

- [x][Xcode](https://itunes.apple.com/us/app/xcode/id497799835?ls=1&mt=12/)

Make sure you have installed Firefox browser on your machine:
```
brew cask install firefox
```
Install Firefox GeckoDriver, link between tests in Selenium and the Firefox browser:
```
brew install geckodriver
```
Navigate to the directory to install:
```
git clone git@github.com:chuk-chuk/acceptance_QAWorks.git
cd acceptance_QAWorks
```
Make sure all dependencies in your Gemfile are available to your application:
```
bundle install
```

Run tests:
```
rspec
```
### Highlights
* These tests were written in Ruby using RSpec, Capybara and Selenium
* I set Capybara's default driver to be Selenium;
* Test do not run in Windows, tests automation setup for Mac OS X;
* Automated other scenarios: invalid email address and required field error.
* The required field error appeared exactly twice the number of expected occurrences. I found out there is a hidden div duplicating these message;
* The form was submitted asynchronously. Capybara does not wait until async calls are finished, and asserts the data on the page that is not yet updated.

### Improvements

 I realised that Capybara provides auto-waiting feature - powerful synchronisation for asynchronous processes, like AJAX calls. To improve my tests I would add a helper called [wait_until](https://shvets.github.io/blog/2013/10/12/acceptance_tricks.html/). Ideally it should wait until all AJAX requests are finished, but I added sleep 5 to it for simplicity.
