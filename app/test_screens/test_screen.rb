class TestScreen < PM::TableScreen

  title "Testing"
  row_height :auto, estimated: 44

  def on_load
    # @test_cells = [*0..25]

  end

  def will_appear
    self.tableView.visibleCells[2].show_buttons(:left)
  end

  def table_data
    [{
      cells: [*0..25].map do |test|
        {
          cell_class: SwipeableCell,
          title: "Cell #{test}",
          properties: {
            delegate: app_delegate,
            right_buttons: [
              {
                title: "Share",
                action: :share,
                color: UIColor.greenColor
              },
              {
                # title: "Save",
                action: :save,
                color: UIColor.yellowColor
              }
            ],
            left_buttons: [
              {
                title: "Remove",
                action: :remove,
                color: UIColor.redColor
              },
              {
                # title: "Archive",
                action: :archive,
                color: UIColor.blueColor,
                arguments:
                  {
                    foo: "bar!"
                  }
              },
              {
                title: "Details",
                action: :details,
                color: UIColor.purpleColor,
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

  def save
    NSLog "#{__method__.capitalize} button tapped"
  end

  def remove(cell)
    NSLog "#{__method__.capitalize} button tapped for cell #{cell}"
  end

  def archive(opts = {})
    NSLog "#{__method__.capitalize} button tapped, with arguments #{opts}"
  end

  def details
    NSLog "#{__method__.capitalize} button tapped"
  end


end
