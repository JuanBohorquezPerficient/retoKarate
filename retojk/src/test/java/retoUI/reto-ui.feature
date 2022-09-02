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
    * def selectBtn = '#addNewRecordButton'
    * def deleteBtn = '#delete-record-undefined'
    * def oKModal = '#closeSmallModal-ok'
    * def userBookList = "//*[@class= 'mr-2']"
    * def bookName = 'Git Pocket Guide'
    # input resources
    * def userName = 'juanperficient'
    * def userPwd = 'JuanPerficient0*'
    * def isbn = '9781449331818'

  Scenario: Karate Ramp Up Challenge UI

    Given driver _url+ _login

    And maximize()
    * delay(tmp * 3)
    * def urlValue = driver.url
    And print 'Title ===> ', driver.title
    And match urlValue == _url + _login
    Then match driver.title == 'ToolsQA'

    # enter credentials (Authentication)
    When input(userNameIn, userName)
    * delay(tmp * 1)
    And input(userPwdIn, userPwd)
    * delay(tmp * 1)
    Then click(loginBtn)
    # going to book list
    * delay(tmp * 1)
    When click(goToBookBtn)

    * delay(tmp * 2)
    # choose a book
    And click(selectedBook)
    * delay(tmp * 2)

    * delay(tmp * 2)
    When scroll(selectBtn)
    And click('{}Add To Your Collection')
    * delay(tmp * 1)
    And dialog(true)
    # going back
    And driver.back()
    Then match text(userBookList) == bookName
    * delay(tmp * 3)
    And driver.back()
    And click(deleteBtn)
    * delay(tmp * 1)
    Then dialog(true)
    * delay(tmp * 5)
    And driver.close()



