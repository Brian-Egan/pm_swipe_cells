class SwipeableCell < SWTableViewCell

  attr_accessor :left_buttons, :right_buttons, :index_path


   def add_right_buttons(cells_to_add = {})
    @right_buttons_array = Array.new
    cells_to_add.each do |opts|
      opts[:title] ||= opts[:action].to_s
      opts[:color] ||= UIColor.blueColor
      @right_buttons_array.sw_addUtilityButtonWithColor(opts[:color], title: opts[:title].to_s.capitalize)
    end
    @right_buttons_array
  end

  def add_left_buttons(cells_to_add = {})
    @left_buttons_array = Array.new
    cells_to_add.each do |opts|
      opts[:title] ||= opts[:action].to_s
      opts[:color] ||= UIColor.blueColor
      @left_buttons_array.sw_addUtilityButtonWithColor(opts[:color], title: opts[:title].to_s.capitalize)
    end
    @left_buttons_array
  end


  def config(opts = {})
    @right_buttons = opts[:right_buttons] if opts[:right_buttons]
    @left_buttons = opts[:left_buttons] if opts[:left_buttons]
    [@right_buttons, @left_buttons].each {|x| add_index_path_argument(x) unless x.nil?}
     if @right_buttons
      self.rightUtilityButtons = add_right_buttons(@right_buttons)
    end
    if @left_buttons
      self.leftUtilityButtons = add_left_buttons(@left_buttons)
    end
  end


  def close
    self.hideUtilityButtonsAnimated(true)
  end


  def show_buttons(side)
    self.send("show#{side.to_s.capitalize}UtilityButtonsAnimated", true) if self.respond_to?("show#{side.to_s.capitalize}UtilityButtonsAnimated")
  end


private

  def add_index_path_argument(buttons)
    buttons.each do |x|
      arity = self.delegate.method(x[:action]).arity
      if arity == 1 and x[:arguments].nil?
        x[:arguments] = self
      end
    end
  end



end