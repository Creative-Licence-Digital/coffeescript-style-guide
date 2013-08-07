## Indentation & whitespace

- Configure your text editor to use **2 spaces**, not tabs.

- Lines should not be longer than 80 characters.

- No whitespace inside brackets:

  ```coffeescript
  test = (params, done) ->
      done null, {}
  ```

- But DO have one space inside curly braces:

  ```coffeescript
  someObj = { a: 1, b: 2 }
  ```

- Surround operators and arrows (`->` and `=>`) with a single space:

  ```coffeescript
  foo = 1 + 2 + 3
  myFunction = -> console.log 'toto'
  ```

- Use a single space after commas:

  ```coffeescript
  console.log 'toto', 'toto2'
  ```

- Indent chains of methods:

  ```coffeescript
  $('#menu')
      .show()
      .addClass('active')
  ```

- Don't use brackets and commas when unnecessary for functions objects and
  arrays:

  ```coffeescript
  myFunc = (params, done) -> 
      result = 1
      done null, result
  
  myObject = 
      myFirstProperty: 1
      mySecondProperty: 2
      myThirdProperty: 3
  
  myArray = [
      'cat'
      'dog'
      'hamster'
  ]
  ```

## Naming

- Use lowerCamelCase for naming variables and functions. Acronyms and
  initialisms should have only their first letter capitalised:

  ```coffeescript
  htmlAndCssFragment = '<p style="color: red">'
  ```

- Try to give functions a verb-like name, and variables a noun-like name.

  ```coffeescript
  name = 'Jack'
  printName = -> console.log name
  ```

- Try to keep variable names positive:

  ```coffeescript
  enableCaptcha = true
  # NOT: disableCaptcha = false
  ```

- Try to use descriptive variable names so that the code is self documenting.
  Break up long expressions with variables so that code doesn't look so
  intimidating to other devs. Variable names that sound read like an English
  sentence when used are really great, if possible.

  **Avoid:**

  ```coffeescript
  if num % 2 is 1
      console.log 'number is odd'
  ```

  **Prefer:**

  ```coffeescript
  even = num % 2 is 0
  if not even
      console.log 'number is odd'
  ```

## Primitives

- Use just `true` and `false`, not `yes`, `no`, `on` or `off`:

  ```coffeescript
  x = true
  ```

- Leave the decimal point off numbers: all numbers should be treated as
  fractional. Keep the leading `0` for numbers between 0 and 1.

  ```coffeescript
  x = 2
  y = 2.3
  z = 0.5
  ```

- Prefer single quotes for strings. Use double quotes when text contains single
  quotes or interpolation is required:

  ```coffeescript
  console.log 'Fred is cool'
  console.log "Fred's alright"
  ```

- Use interpolation instead of concatenation:

  ```coffeescript
  console.log "#{name} is #{age}"
  ```

## Operators

- Prefer `and`, `or`, `not` to `&&`, `||`, `!`:

  ```coffeescript
  if messageShouldBeSent and not tooLate
      send "toto"
  ```

- Prefer `is`, `isnt`, to `==` or `!=`:

  ```coffeescript
  myVariable += 1 if myVariable is 5 
  myOtherVariable -= 1 if myVariable isnt 0
  ```

- Prefer `@` to `this`:

  ```coffeescript
  @property = "toto"
  ```

- Prefer destructuring for assignment when possible:

  ```coffeescript
  [y, x] = [x, y]

  [firstName, lastName] = "Chubby Checker".split /\s/

  [firstWord, otherWords...] = "scrambled cassovary procedure".split /\s/ 

  { name, age } = { name : "Chubby Checker", age : 53 }
  ```

## Conditions
  
- Use chained operators instead of multiple comparisons:

  ```coffeescript
  if 10 < x < 20 
      doSomething()
  ```

- Use the `?` operator (for default assignement):

  ```coffeescript
  someFunc = (myAge) ->
      myAge ?= 33
  ```

- Use the `?` operator for variable existence:

  ```coffeescript
  coolFramework = yes if chubby? and not oldElvis?
  ```

- Use the `?` operator for testing non defined callbacks:

  ```coffeescript
  tooLateToWalkOnWater = ({age}, done) -> 
      done? null, age > 33
  ```

- Use the elvis operators instead of checking for `null` explicitly:

  ```coffeescript
  age = person?.getAge?().intValue
  ```

- Only use `unless` if the condition is rarely true, and in its postfix form.
  *It's usually safer to just never use `unless`*:

  **Avoid:**

  ```coffeescript
  unless foo < 2
      bar()

  unless extremelyUnlikelyThing
      doSomething()
  ```

  **Prefer:**

  ```coffeescript
  if foo >= 2
      bar()

  doSomething() unless extremelyUnlikelyThing
  ```

## Enumeration 

- Prefer loop comprehensions or map/filter/reduce rather than loops.

  **Avoid:**

  ```coffeescript
  ages = []
  for person in persons
      if person.age > 30
          ages.push person.age
  ```

  **Prefer:**

  ```coffeescript
  ages = persons
      .filter (p) -> p.age > 30
      .map (p) -> p.age

  ages = (person.age for person in persons when person.age > 30)
  ```

  **Avoid:**

  ```coffeescript
  ageSum = 0
  for person in persons
      ageSum += person.age
  ```

  **Prefer:**

  ```coffeescript
  ageSum = persons.reduce (sum, p) ->
      sum + p.age
  , 0
  ```

## Functions

- DON'T use `return` for *small* (one or two expressions) functions:

  ```coffeescript
  add = (x, y) -> 
    x + y
  ```

- But DO use `return` for larger functions or functions with multiple return
  points:

  ```coffeescript
  sumFirst = (a, b) ->
      if not a?
          return null
      if not b?
          return null
      return a[0] + b[0]
  ```

- Use the do operator for closures:

  ```coffeescript
  for age in ages
      do (age) -> 
          setTimeout -> 
              console.log age
          , 100
  ```

- Write default arguments in the function declaration:

  ```coffeescript
  totalUsage = (users = [], done) -> 
      usage = users.reduce (total, user) -> 
          total + user.usage
        , 0
      done? null, { usage }
  ```

- Use destructuring in function arguments for parameter style functions:

  **Avoid:**
  
  ```coffeescript
  add = (params, done) ->
      done null, params.a + params.b
  ```

  **Prefer:**

  ```coffeescript
  add = ({ a, b }, done) ->
      done null, a + b
  ```

- Use the fat arrow instead of binding functions manually:

  **Avoid:**

  ```coffeescript
  that = @
  $('.header').click ->
      that.doSomething()
  ```

  **Prefer:**

  ```coffeescript
  $('.header').click =>
      @doSomething()
  ```

- Don't define more than one function on a single line:

  **Avoid:**

  ```coffeescript
  list.map((p) -> p.age).filter((a) -> a > 20)
  ```

  **Prefer:**

  ```coffeescript
  list
      .map (p) -> p.age
      .filter (a) -> a > 20
  ```

- **A declared function must have ONLY a `)` or new line after it.** this prevents
  many subtle bugs caused by a function body taking over an expression, as well
  as plain invalid CoffeeScript.

  **Wrong (won't compile):**

  ```text
  if _.any users, (u) -> u.active and userWidgetEnabled
      showUserWidget()
  ```

  **Correct:**

  ```coffeescript
  if _.any(users, (u) -> u.active) and userWidgetEnabled
      showUserWidget()
  ```

  **Wrong (invalid semantics):**

  ```coffeescript
  show = _.any users, (u) -> u.active and userWidgetEnabled
  ```

  **Correct:**

  ```coffeescript
  show = _.any(users, (u) -> u.active) and userWidgetEnabled
  ```

  When it doubt, write it more explicitly :)

- Put brackets around arguments when necessary, not around the entire function
  invocation:

  **Avoid:**

  ```coffeescript
  (($ '.header').addClass 'active').show()
  ```

  **Prefer:**

  ```coffeescript`
  $('.header').addClass('active').show()
  ```

## General advice

- Keep functions small and focused on doing one thing.

  A function larger than 20 or so lines probably indicates that it is trying to
  do too much. Seperate the function into smaller functions (joining them
  together using something like `bf.chain`) or look for some repeated pattern
  that can be abstracted away.

- Don't repeat yourself.

  If you find yourself typing similar code more than a few times, this indicates
  some abstraction that can be made.

  **Avoid:**

  ```coffeescript
  getUser = ({ id }, done) ->
      User.findById id, done

  getAccount = ({ id }, done) ->
      Account.findById id, done

  # ...etc

  getAddress = ({ id }, done) ->
      Address.findById id, done
  ```

  **Prefer:**

  ```coffeescript
  getUser = get User
  getAccount = get Account
  # ...etc
  getAddress = get Address

  get = (model) ->
      ({ id }, done) ->
          model.findById id, done
  ```
