class Pagination

  attr_reader :current_page, :next, :previous, :total

  def initialize(params)
    @current_page = params["current"]
    @next = params["next"]
    @previous = params["previous"]
    @total = params["pages"]
  end

  def has_next?
    @next.present?
  end

  def has_previous?
    @previous.present?
  end

end