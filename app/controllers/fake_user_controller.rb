class FakeUserController < ApplicationController
  def get
    filtered_params = get_params

    seed = filtered_params[:seed]
    size = filtered_params[:size]
    region = formatted_region(filtered_params[:region])
    

    if seed
      fake_user_by_seed = FakeUser.find_by_id(seed)
      
      if fake_user_by_seed
        render json: {fake_user: fake_user_by_seed}, status: 200
      else
        render json: {message: "No user found for given seed"}, status: 400
      end
      
    elsif size
      # Check for specific regions if specified otherwise return random users
        if Integer(size) < 256
          
          if region
            fakes_users_by_ids_for_size_region_param = FakeUser
              .where(`id IN (?) && region in (?)`, [shuffled_random_ids.slice(0, Integer(size)), region])
              .limit(size)
            render json: {fake_users: fakes_users_by_ids_for_size_region_param }, status: 200
          else

            # Find the users with given ids

            fakes_users_by_ids_for_size_param = FakeUser
              .where('id IN (?)', shuffled_random_ids.slice(0, Integer(size)))
              .limit(size)

            render json: {fake_users: fakes_users_by_ids_for_size_param}, status: 200
          end

        else
          render json: {message: "Max allowed value for size is 256"}, status: 400
        end

    elsif region
      fakes_users_by_ids_for_region_param = FakeUser.where('region in (?)', region)
      render json: {fake_user: fakes_users_by_ids_for_region_param}, status: 200
    
    else
      render json: {fake_user: FakeUser.find_by_id(random_fake_user_id)}, status: 200
    end
  end

  private

  def random_fake_user_id
    # total_fake_users = FakeUser.all.count

    # random_id = rand(total_fake_users)
    # while !FakeUser.find_by_id(random_id)
    #   random_id = rand(total_fake_users)
    # end

    # return random_id

    return shuffled_random_ids[0]
  end

  def shuffled_random_ids
    fake_users_ids = FakeUser.pluck(:id)
    fake_users_ids.shuffle
  end

  def get_params
    params.permit(:size, :seed, :region => [])
  end

  def formatted_region (region)
    formatted_values = []
    if region
       region.each do |val|
        formatted_values.push(JSON.parse(val))
      end
      formatted_values
    end
  end
end
