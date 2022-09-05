Feature: demoQA
  for help, see: https://github.com/intuit/karate/wiki/IDE-Support

  Background:
    # variables de UI
    * url _url
    * def sleep = function(millis){java.langThread.sleep(millis)}
    * def tmp = 1000
    # drivers
    * configure driver = {type:'geckodriver', executable: 'src\\test\\java\\drivers\\firefox\\geckodriver.exe', webDriverSession: {capabilities: {browserName: 'firefox'}}}
    #* configure driver = {type:'msedgedriver', executable: 'src\\test\\java\\drivers\\edge\\msedgedriver.exe', webDriverSession: {capabilities: {browserName: 'edge'}}}
    #* configure driver = {type:'chromedriver', executable: 'src\\test\\java\\drivers\\chrome\\chromedriver.exe', webDriverSession: {capabilities: {browserName: 'chrome'}}}
      # selectors
    * def userNameIn = '#userName'
    * def userPwdIn = '#password'
    * def loginBtn = '#login'
    * def goToBookBtn = '#gotoStore'
    * def selectedBook = '{a}Git Pocket Guide'
    * def selectedBook2 = '{}Speaking JavaScript'
    * def selectBtn = '#addNewRecordButton'
    * def deleteBtn = '#delete-record-undefined'
    * def oKModal = '#closeSmallModal-ok'
    * def userBookList = "//*[@class= 'mr-2']"
    * def emptyCell = "//div[@class= 'rt-td']"
    * def bookName = 'Git Pocket Guide'
    * def bookName2 = 'Speaking JavaScript'
    * def backToStore = '#addNewRecordButton'
    * def bookName = 'Git Pocket Guide'

    # input resources
    * def userName = 'juanperficient'
    * def userPwd = 'JuanPerficient0*'
    * def isbn = '9781449331818'

  Scenario: Karate Ramp Up Challenge UI

    Given driver _url+ _login

    And maximize()


    And maximize()
    * def urlValue = driver.url
    And print 'Title ===> ', driver.title
    And match urlValue == _url + _login
    Then match driver.title == 'ToolsQA'
    # enter credentials (Authentication)
    When input(userNameIn, userName)
    And input(userPwdIn, userPwd)
    Then click(loginBtn)
    # going to book list
    When click(goToBookBtn)
    # choose a book
    And click(selectedBook)
    When scroll(selectBtn)
    And click('{}Add To Your Collection')
    And dialog(true)
    # going back
    And driver.back()
    # matches the name of the book it just added
    Then match text(userBookList) == bookName
    And driver.back()
    # Delete the chosen book
    And click(deleteBtn)
    Then click(oKModal)
    Then dialog(true)
    And dialog(true)
    # matching that deleted book does not appear
    Then match text(emptyCell) == ''
    # enters to store again
    When click(goToBookBtn)
    # chooses another book
    When click(goToBookBtn)
    Then click(selectedBook2)
    And click('{}Add To Your Collection')
    And dialog(true)
    Then click(oKModal)
    And click(backToStore)
    When driver.back()
    Then match text(userBookList) == bookName2
    And driver.back()
    # Delete the 2nd chosen book
    And click(deleteBtn)
    Then click(oKModal)
    And dialog(true)
    And dialog(true)
   And driver.close()


  # *** credentials for UI test ***
  #juanperficient
  #JuanPerficient0*
