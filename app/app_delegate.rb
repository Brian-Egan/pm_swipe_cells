class AppDelegate < PM::Delegate
  status_bar true, animation: :none

  def on_load(app, options)
    return true if RUBYMOTION_ENV == "test"
    open TestScreen.new(nav_bar: true)
  end


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

end
