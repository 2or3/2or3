class Animal
  constructor: (name) ->
    @name = name
  say: (word) ->
    console.log "#{@name} said: #{word}"

class Dog extends Animal
  constructor: (name) ->
    super name
  say: (word) ->
    super "Bowwow, #{word}"

dog = new Dog("Bob")
dog.say("Hello!")

