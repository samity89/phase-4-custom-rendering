class CheesesController < ApplicationController

  # GET /cheeses
  def index
    cheeses = Cheese.all
    render json: cheeses, only: [:id, :name, :price, :is_best_seller], methods: [:summary]
    # alternatively
    # render json: cheeses, except: [:created_at, :updated_at], methods: [:summary]
  end

  # GET /cheeses/:id
  def show
    cheese = Cheese.find_by(id: params[:id])
    # the code below dictates a custom rendering for the json
    # render json: {
    #   id: cheese.id,
    #   name: cheese.name,
    #   price: cheese.price,
    #   is_best_seller: cheese.is_best_seller
    # }
    if cheese
      render json: cheese, except: [:created_at, :updated_at], methods: [:summary]
    else
    # status: :not_found will produce a 404 status code
    render json: { error: 'Cheese not found' }, status: :not_found
    end
  end

end
