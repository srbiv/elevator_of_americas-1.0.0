# ElevatorOfAmericas

Welcome! This is a small project to build out an elevator in code. The goals of this project is to write business logic around how an elevator is dispatched.

This project includes 2 classes defined for you. `ElevatorBank` and `Elevator`.

A few requirements:

  * The elevator bank must have at least 3 elevators
  * The elevator bank must have a way to have elevators dispatched to certain floors
  * The elevators must follow rules as to which one is dispatched to which floor.
  * When we instantiate an elevator bank, let's make sure the elevators are on random floors so we have a realistic experience.

Extra Credit:

  * Include semantics about perhaps time and certain floor volume. (IE: If a floor dispatches an elevator more often, should something happen when all elevators are idle?)

# Example of what we're looking to accomplish

```ruby
bank = ElevatorBank.new
bank.dispatch_to(3, :down) # => Figures out which elevator can be dispatched to the elevator and sends it there for a certain direction
bank.elevators => # Returns all elevators and where they are and perhaps state (idle, moving_up, moving_down)
```

# Specs

This also includes `RSpec`, if you're more comfortable with another testing toolkit, please feel free to change it.