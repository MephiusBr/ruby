require 'ruby2d'

set title: 'Mephius simple game'
set background: 'black'

game_has_started = false
message = Text.new('Click to begin the game.')
square = nil
start_time = nil
duration = nil
square_size = 30

on :mouse_down do |event| 
  if game_has_started 
    if square.contains?(event.x, event.y)
      duration = ((Time.now - start_time) * 1000).round
      message = Text.new("Duration time in milliseconds: #{duration}")
      square.remove
      game_has_started = false
    end
  else
    message.remove 
    square = Square.new(
      x: rand(get(:width) - square_size), 
      y: rand(get(:height) - square_size), 
      size: square_size, 
      color: 'green'
    )
    start_time = Time.now
    game_has_started = true
  end
end

show
