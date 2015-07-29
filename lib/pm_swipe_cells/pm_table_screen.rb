module ProMotion

  class TableScreen < TableViewController

    def on_cell_created(cell, data)
      super

      cell.setDelegate((data[:delegate].nil? ? self : data[:delegate]))
      cell.config(right_buttons: data[:properties][:right_buttons], left_buttons: data[:properties][:left_buttons]) if cell.respond_to?(:config)
    end

    def tableView(tableView, cellForRowAtIndexPath: indexPath)
      cell = super
      cell.index_path = indexPath
      cell
    end

    def swipeableTableViewCell(cell, didTriggerRightUtilityButtonWithIndex: index)
      trigger_action(cell.right_buttons[index][:action], cell.right_buttons[index][:arguments], cell.index_path) if (cell.right_buttons and cell.right_buttons[index])
    end


    def swipeableTableViewCell(cell, didTriggerLeftUtilityButtonWithIndex: index)
      trigger_action(cell.left_buttons[index][:action], cell.left_buttons[index][:arguments], cell.index_path) if (cell.left_buttons and cell.left_buttons[index])
    end

  end

end

