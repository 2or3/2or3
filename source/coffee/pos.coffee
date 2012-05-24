pos = 
  x: 100
  y: 200
  dump: ->
    func = =>
      console.log "x:#{@x}, y:#{@y}"
    func()
