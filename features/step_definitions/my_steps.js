const {
  Given,
  When,
  Then
} = require('@cucumber/cucumber')
Given(/^a user "([^"]*)"$/, function (user) {
  console.log(user)
})
Given(/^there are folders on the filesystem$/, function () {

})
Given(/^that the app can access the filesystem$/, function () {

})
When(/^"([^"]*)" imports the "([^"]*)" folder$/, function () {

})
Then(/^the folder "([^"]*)" should be added to the list of folders$/, function () {

})
Then(/^the folder "([^"]*)" should be a sub folder of "([^"]*)"$/, function () {

})
