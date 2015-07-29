# PMSwipeCells

This gem provides an easy way to utilize the swipeable content view and buttons of SWTableViewCell within the ProMotion framework for RubyMotion.

<p align="center"><img src="http://i.imgur.com/njKCjK8.gif"/></p>

## Installation

First, add to your Gemfile:
```ruby
gem 'pm_swipe_cells'
```

Then:

```sh-session
$ bundle
$ rake pod:install
```

## Usage

PMSwipeCells works by adding a custom cell class and hooking into certain methods on PM::TableScreen. 

To use, just add a few extra lines to the `table_data` hash in a PM:TableScreen. In each cell which you want to be swipeable, specify the `cell_class:` `SwipeableCell` and then add a `properties:` hash which includes a `right_buttons` and/or `left_buttons` array.

Each array takes up to 5 parameters, one of which is required:
    - **Required**
        + *action*: The action you want that button to perform, passed as a Symbol.
            * **You must also remember to implement each action in your PM::TableScreen controller!**
    - **Recommended**
        + *color*: A UIColor for the button's background (defaults to UIColor.blueColor).
        + *title*: The text displayed on the button (defaults to the action name).
    - **Optional**
        + *Arguments*: Arguments to be passed to the action. Use a hash if multiple.
            * **If no argument is set, but your cell action takes a single parameter, the cell will be passed to your action (see `remove` example)

You can use just right buttons, just left_buttons or place buttons on both sides of a cell.

Here's an example of it in use:

```ruby
class TestScreen < PM::TableScreen
# This example creates 25 cells, all with swipeable button.

    def table_data
        [{
          cells: [*0..25].map do |test|
            {
              cell_class: SwipeableCell,
              title: "Test Cell",
              properties: {
                right_buttons: [
                  {
                    title: "Share",
                    action: :share,
                    color: UIColor.greenColor
                  }
                ],
                left_buttons: [
                  {
                    title: "Remove",
                    action: :remove,
                    color: UIColor.redColor
                  },
                  {
                    title: "Archive",
                    action: :archive,
                    color: UIColor.blueColor,
                    arguments:
                      {
                        foo: "bar!"
                      }
                  }
                ]
              }
            }
          end
        }]
    end


  def share
    NSLog "#{__method__.capitalize} button tapped!"
  end

  def remove(cell)
    NSLog "#{__method__.capitalize} button tapped for cell #{cell}"
  end

  def archive(opts = {})
    NSLog "#{__method__.capitalize} button tapped, with arguments #{opts}"
  end

end
```

# Additional Methods

Cells of the SwipeableCell class have two additional methods available; `close` and `show_buttons(:side)`. While the touch interactions to show/hide swipe buttons are automatically enabled, I find it helpful to be able to programmatically reveal them. For example, it can be helpful to show a cell sliding open and closed alongside a tooltip or walkthrough the first time a user opens a screen.

Calling `show_buttons`, which takes either `:left` or `:right` as an argument will slide the cell open, revealing the buttons on the specified side. As luck would have it, calling `close` on a cell will then slide it closed.

# Additional Notes

PMSwipeCell pre-configures your PM::TableScreen to act as the cell's delegate, however if you need to change this you can manually specific a delegate controller by passing the `delegate` arguments into the cell's `properties` hash. 
    - **Note that changing this requires that you then implement the delegate actions and the cell actions in your delegate controller**


# Cell Delegate Actions

If you decide to use your own delegate controller, there are two delegate actions which need to be implemented depending on which side(s) you placed buttons on.

```ruby
    def swipeableTableViewCell(cell, didTriggerLeftUtilityButtonWithIndex: index)
        NSLog "A Left button was pressed for cell #{cell}"
        NSLog "The action which should be implemented is #{cell.left_buttons[index][:action]}"
        NSLog "The accompanying arguments are #{cell.left_buttons[index][:arguments]}" unless cell.left_buttons[index][:arguments].nil?
    end

    def swipeableTableViewCell(cell, didTriggerRightUtilityButtonWithIndex: index)
        NSLog "A RIGHT button was pressed for cell #{cell}"
        NSLog "The action which should be implemented is #{cell.right_buttons[index][:action]}"
        NSLog "The accompanying arguments are #{cell.right_buttons[index][:arguments]}" unless cell.right_buttons[index][:arguments].nil?
    end
```
