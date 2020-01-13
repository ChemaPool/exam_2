class SimilarHome
  include Mongoid::Document

  def self.owner_home
    owners_id = Owner.pluck(:id)
    homes = []

    owners_id.each do |id|
      owner = Owner.includes(:homes).find(id)
      homes = owner.homes
      next if homes.length == 1

      homes_size = homes.size
      homes.map do |home|
        #next if index + 1 < homes_size

        # if index + 1 < homes_size # guard clause

          current_home = Home.find_by(id: home)
          if current_home.master_home_id.nil? && current_home.published?
            # next_home = homes[index + 1]
            second_home = Home.find(homes)
            first_total_amount = current_home.total_amount
            second_total_amount = second_home.total_amount
            first_location = current_home.location
            second_location = second_home.location

            if first_total_amount == second_total_amount && first_location == second_location
              puts  "#{owner.user.name}, " \
                    "#{owner.user.email}, " \
                    "#{current_home.id}, " \
                    "#{current_home.total_amount}, " \
                    "#{current_home.status}, " \
                    "#{current_home.location}"
            end

          end

        # end

      end
    end
  end
end