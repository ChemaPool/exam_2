class SimilarHome
  include Mongoid::Document

  private

  def self.match_owner_home
    owners_id = Owner.pluck(:id)
    owner_home = []

    owners_id.each do |id|
      owner = Owner.find(id)
      owner_home = Home.where(owner_id: id).pluck(:id)

      next if owner_home.length == 1

      owner_home.each_with_index do |home, index|
        if index + 1 < owner_home.length

          firts_home = Home.find(id: home)
          next if firts_home.master_home_id != nil
          next unless firts_home.published?

          next_home = owner_home[index + 1]
          second_home = Home.find(id: next_home)
          if firts_home.total_amount == second_home.total_amount && firts_home.location == second_home.location
            puts "#{owner.user.name}, #{owner.user.email}, #{firts_home.id}, #{firts_home.total_amount}, #{firts_home.status}, #{firts_home.location}"
          end
        end
      end
    end
  end
end