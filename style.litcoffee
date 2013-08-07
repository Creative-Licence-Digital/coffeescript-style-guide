## Indentation & whitespace

- Configure your text editor to use **2 spaces**, not tabs.

- Lines should not be longer than 80 characters.

- No whitespace inside brackets:

    test = (params, done) ->
      done null, {}

- But DO have one space inside curly braces:

    someObj = { a: 1, b: 2 }

- Surround operators and arrows (`->` and `=>`) with a single space:

    foo = 1 + 2 + 3
    myFunction = -> console.log 'toto'

- Use a single space after commas:

    console.log 'toto', 'toto2'

- Indent chains of methods:

    $('#menu')
      .show()
      .addClass('active')

- Don't use brackets and commas when unnecessary for functions objects and
  arrays:

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

## Naming

- Use lowerCamelCase for naming variables and functions. Acronyms and
  initialisms should have only their first letter capitalised:

    htmlAndCssFragment = '<p style="color: red">'

- Try to give functions a verb-like name, and variables a noun-like name.

    name = 'Jack'
    printName = -> console.log name

- Try to keep variable names positive:

    enableCaptcha = true
    # NOT: disableCaptcha = false

- Try to use descriptive variable names so that the code is self documenting.
  Break up long expressions with variables so that code doesn't look so
  intimidating to other devs. Variable names that sound read like an English
  sentence when used are really great, if possible.

  Avoid:

    if num % 2 is 1
      console.log 'number is odd'

  Prefer:

    even = num % 2 is 0
    if not even
      console.log 'number is odd'

## Primitives

- Use just `true` and `false`, not `yes`, `no`, `on` or `off`:

    x = true

- Leave the decimal point off numbers: all numbers should be treated as
  fractional. Keep the leading `0` for numbers between 0 and 1.

    x = 2
    y = 2.3
    z = 0.5

- Prefer single quotes for strings. Use double quotes when text contains single
  quotes or interpolation is required:

    console.log 'Fred is cool'
    console.log "Fred's alright"

- Use interpolation instead of concatenation:

    console.log "#{name} is #{age}"

## Operators

- Prefer `and`, `or`, `not` to `&&`, `||`, `!`:

    if messageShouldBeSent and not tooLate
      send "toto"

- Prefer `is`, `isnt`, to `==` or `!=`:

    myVariable += 1 if myVariable is 5 
    myOtherVariable -= 1 if myVariable isnt 0

- Prefer `@` to `this`:

    @property = "toto"

- Prefer destructuring for assignment when possible:

    [y, x] = [x, y]

    [firstName, lastName] = "Chubby Checker".split /\s/

    [firstWord, otherWords...] = "scrambled cassovary procedure".split /\s/ 

    { name, age } = { name : "Chubby Checker", age : 53 }


## Conditions
  
- Use chained operators instead of multiple comparisons:

    if 10 < x < 20 
      doSomething()

- Use the `?` operator (for default assignement):

    someFunc = (myAge) ->
      myAge ?= 33

- Use the `?` operator for variable existence:

    coolFramework = yes if chubby? and not oldElvis?

- Use the `?` operator for testing non defined callbacks:

    tooLateToWalkOnWater = ({age}, done) -> 
      done? null, age > 33

- Use the elvis operators instead of checking for `null` explicitly:

    age = person?.getAge?().intValue

- Only use `unless` if the condition is rarely true. *It's usually safer to just
  never use `unless`*:

    doSomething() unless extremelyUnlikelyThing

## Enumeration 

- Prefer loop comprehensions or map/filter/reduce rather than loops.

  Avoid:

    ages = []
    for person in persons
      if person.age > 30
        ages.push person.age

  Prefer : 

    ages = persons
      .filter (p) -> p.age > 30
      .map (p) -> p.age

    ages = (person.age for person in persons when person.age > 30)

  Avoid:

    ageSum = 0
    for person in persons
      ageSum += person.age

  Prefer:

    ageSum = persons.reduce (sum, p) ->
      sum + p.age
    , 0

## Functions

- DON'T use `return` for *small* (one or two expressions) functions:

    add = (x, y) -> 
      x + y

- But DO use `return` for larger functions or functions with multiple return
  points:

    sumFirst = (a, b) ->
      if not a?
        return null
      if not b?
        return null
      return a[0] + b[0]

- Use the do operator for closures:

    for age in ages
      do (age) -> 
        setTimeout -> 
          console.log age
        , 100

- Write default arguments in the function declaration:

    totalUsage = (users = [], done) -> 
      usage = users.reduce (total, user) -> 
        total + user.usage
      , 0
      done? null, { usage }

- Use destructuring in function arguments for parameter style functions:

  Avoid:

    add = (params, done) ->
      done null, params.a + params.b

  Prefer:

    add = ({ a, b }, done) ->
      done null, a + b

- Use the fat arrow instead of binding functions manually:

  Avoid:

    that = @
    $('.header').click ->
      that.doSomething()

  Prefer:

    $('.header').click =>
      @doSomething()

- Don't define more than one function on a single line:

  Avoid:
    
    list.map((p) -> p.age).filter((a) -> a > 20)

  Prefer:

    list
      .map (p) -> p.age
      .filter (a) -> a > 20

- **A declared function must have ONLY a `)` or new line after it.** this prevents
  many subtle bugs caused by a function body taking over an expression, as well
  as plain invalid CoffeeScript.

  Wrong (won't compile):
    
    ###
    if _.any users, (u) -> u.active and userWidgetEnabled
      showUserWidget()
    ###

  Correct:

    if _.any(users, (u) -> u.active) and userWidgetEnabled
      showUserWidget()

  Wrong (invalid semantics):

    show = _.any users, (u) -> u.active and userWidgetEnabled

  Correct:

    show = _.any(users, (u) -> u.active) and userWidgetEnabled

  When it doubt, write it more explicitly :)

- Put brackets around arguments when necessary, not around the entire function
  invocation:

  Avoid:

    (($ '.header').addClass 'active').show()

  Prefer:

    $('.header').addClass('active').show()
