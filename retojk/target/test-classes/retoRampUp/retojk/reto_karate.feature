Feature: demoQA
  for help, see: https://github.com/intuit/karate/wiki/IDE-Support

  Background:
    * url _url
    * def user = read('classpath:jsonUsers/users.json')
    * def book = read('classpath:jsonBooks/bookModel.json')
    * def dataFaker = Java.type('helper.FakerJK')
    * def username = dataFaker.getUserName()
    * def password = dataFaker.getPassword()
    # setea las variables
    * set user.userName = username
    * set user.password = password

  Scenario: Karate Ramp Up Challenge
    # create account
    Given path '/Account/v1/User'
    And request user
    When method post
    And print response.userID
    * def realUserId = response.userID
    And print response.username
    Then status 201
    # generate token
    Given path '/Account/v1/GenerateToken'
    And request user
    When method post
    Then status 200
    * def token = response.token
    * set book.userID = realUserId

    And print response
    And print token
    # generate authentication
    Given path '/Account/v1/Authorized'
    And request user
    When method post
    Then status 200
    And match response == 'true'
    And print "Response -----------> " + response
    # get all books
    Given path 'BookStore/v1/Books'
    When method get
    Then status 200
    And print response
    * def isbn = response.books[0].isbn
    * def book_title = response.books[0].title
    # add a book
    * set book.collectionOfIsbns[*].isbn = isbn
    * set book.userId = realUserId
    And print book.userID
    Given path 'BookStore/v1/Books'
    And header Authorization = 'Bearer ' + token
    And request book
    When method post
    And print response
    Then status 201


