** Indentations, whitespaces, ... **

- Your text editor should be configured to not create tabs, but whitespaces when you indent. 
- A indentation should be equal to 2 whitespaces. 
- Line length should be limited to 80 characters.
- No whitespaces inside brackets

    (myFunc 'test')

- One whitespace around those operators : =, +=, >, ..

    myVar = 1
    test = (params = {}, done) -> 
      done null, {}

- One whitespace after a comma

    console.log "toto", "toto2"

- One white space before -> or => 

    myFunc = -> console.log "toto"

- Naming Conventions : use camelCase for naming variables, functions

    myFunction = -> console.log "toto"
    myVariable = 10


** Use keywords or nothing instead of symbols when possible **

- Prefer and, or, not to &&, ||, !
    if messageShouldBeSent and notToLate
      send "toto"

    if messageShouldBeSent or not toLate
      send "toto"

- Prefer is, isnt, to == or !=

    myVariable += 1 if myVariable is 5 
    myOtherVariable -= 1 if myVariable isnt 0

- Prefer @ to this
  
    @property = "toto"

- Prefer no brackets when it's not necessary : Function declaration 

    myFunc = (params, done) -> 
      result = 1
      done null, result

- Prefer no curly brackets and no commas when it's not necessary : Object Declaration 
    
    myObject = 
      myFirstProperty : 1
      mySecondProperty
      myThirdProperty : 4

- Don't use return when it's not necessary. (Unless using return gives more clarity to the code) 
    
    add = (x, y) -> 
      x + y


** Comparisons **
  
- Use chained operators instead of multiple comparisons
    
    if 10 < x < 20 
      doSomething()
      
- use the ? operator (for default assignement)

    myAge ?= 33

- use the ? operator for variable existence

    coolFramework = yes if chubby? and not barefoot?

- use the ? operator for testing non defined callbacks

    tooLateToWalkOnWater = ({age}, done) -> 
      done? null, age > 33

- soaking
    
    age = person?.getAge?().intValue
    

** Enumeration **

- Prefer loop comprehensions or map/filter/reduce functions to for loop constructions

To avoid : 
    ages = []
    for person in persons
      if person.age > 30
        ages.push person.age
 
To prefer : 
    ages = persons.map (person) -> person.age

    ages = persons
             .filter (p) -> p.age > 30
             .map (p) -> p.age

    ages = (person.age for person in persons)

    ages = (person.age for person in persons when person.age > 30)

To avoid : 
    ageSum = 0
    for person in persons
      ageSum += person.age

To perfer
    ageSum = persons.reduce (result, person) -> 
      result += person.age
    , 0


** Closures **

- Use the do operator
    for age in ages
      do (age) -> 
        setTimeout () -> 
          console.log age
        , 100


** Assignement / Destructuration **

- Use destructuration when possible

    [y, x] = [x, y]

    [firstName, lastName] = "Chubby Checker".split /\s/

    [firstWord, otherWords...] = "scrambled cassovary procedure".split /\s/ 

    { name, age } = { name : "Chubby Checker", age : 53 }

    isRockStar = ({name, age}, done) -> 
      done null, name is "Chubby Checker" or age < 27

- Use default parameters instead of assigning default values inside the function

    totalUsage = (users = [], done) -> 
      usage = users.reduce (total, user) -> 
        total + user.usage
      , 0
      done? null, { usage }


** Strings **

- Use interpolation instead of concatenation
    
    console.log "#{name} is #{age} old"


