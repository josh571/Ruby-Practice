# Defining a function called gold_room. This function captures standard input ad assigns it to a 
# variable called choice. The method .include? is invoked on the choice object, and will return 
# true to the if statement if choice includes 0 or 1.
# The else statement will return the variable 'dead' and assign a reason.
def gold_room
  puts "This room is full of gold. How much do you take?"

  print "> "
  choice = $stdin.gets.chomp

  # This line has a bug, so fix it
  if choice.include?("0") || choice.include?("1")
    how_much = choice.to_i
  else
    dead("Man, learn to type a number.")
  end

  if how_much < 50
    puts "Nice, you're not greedy, you win!"
    exit(0)
  else
    dead("You greedy bastard!")
  end
end
# This is pretty much the same thing as the gold room block of code
# except, a placeholder called bear_moved is set to false and used later in the program
# this is used as a sort of 'switch' 
def bear_room
  puts "There is a bear here."
  puts "The bear has a bunch of honey."
  puts "The fat bear is front of another door."
  puts "How are you going to move the bear?"
  bear_moved = false
# this part begins an infinite loop
  while true
    print "> "
    choice = $stdin.gets.chomp
  
    if choice == "take honey"
      dead("The bear looks at you and then slaps your face off.")
      # when this is passed by the user, bear_moved is reset to true
    elsif choice == "taunt bear" && !bear_moved
      puts "The bear has moved from the door. You can go through it now."
      bear_moved = true
    elsif choice == "taunt bear" && bear_moved
      dead("The bear gets pissed off and chews your legs off.")
    elsif choice == "open door" && bear_moved
      gold_room
    else
      puts "I got no idea what that means."
    end
  end
end

def cthulhu_room
  puts "Here you see the great evil Cthulhu."
  puts "He, it, whatever stares at you and you go insane."
  puts "Do you flee for you life or ear your head?"

  print "> "
  choice = $stdin.gets.chomp

  if choice.include? "flee"
    start
  elsif choice.include? "head"
    dead("Well that was tasty!")
  else
    cthulhu_room
  end
end

def dead(why)
  puts why, "Good job!"
  exit(0)
end

def start 
  puts "You are in a dark room."
  puts "There is a door to your right and left."
  puts "which one do you take?"

  print "> "
  choice = $stdin.gets.chomp

  if choice == "left"
    bear_room
  elsif choice == "right"
    cthulhu_room
  else
    dead("You stumble around the room until you starve.")
  end
end

start
    

    
