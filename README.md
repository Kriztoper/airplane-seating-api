# Airplane Seating API

A simple REST API that helps seat audiences in a flight from aisle seats to window seats then center seats

* **Ruby version**: ruby 2.6.3p62 (2019-04-16 revision 67580) [x86_64-darwin19]


* **Rails version**: Rails 6.1.7


* **Bundler version**: 2.2.25


* **To install gem dependencies on local** (run the following command) (Note: The dependency management tool we are
  using for this project is **Bundler**): `bundle install`


* **Database**: sqlite3 v1.5.0


* **Database creation and initialization** (run the following command): `rails db:create db:migrate db:seed`


* **Run Puma server on local** (run the following command): `rails s`


* **Puma server version**: 5.6.5 (ruby 2.6.3-p62) ("Birdie's Version")


* **To run the test** (run the following command): `rails test`

  Output for running test case of provided example:
  ```
  result of init seats for [[3,2], [4,3], [2,3], [3,4]]:
  {
  [19, 25, 1]
  [21, 29, 7]

  [2, 26, 27, 3]
  [8, 30, 0, 9]
  [13, 0, 0, 14]

  [4, 5]
  [10, 11]
  [15, 16]

  [6, 28, 20]
  [12, 0, 22]
  [17, 0, 23]
  [18, 0, 24]

  }
  ```