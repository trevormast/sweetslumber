module WorkshopsHelper
  def spots_left(workshop)
    workshop.limit - workshop.users.count
  end
end
