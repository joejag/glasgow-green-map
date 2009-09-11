module PostcodesHelper

  def clean(input)
    add_space(input)
  end
  
  def add_space(input)
    input.gsub(/(\w+\d+)(\s*)(\d\w+)/, '\1 \3')
  end
  
end
