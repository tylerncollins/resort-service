class ResortsController < ApplicationController
  def index
    resorts = ResortResource.all(params)
    respond_with(resorts)
  end

  def show
    resort = ResortResource.find(params)
    respond_with(resort)
  end

  def create
    resort = ResortResource.build(params)

    if resort.save
      render jsonapi: resort, status: 201
    else
      render jsonapi_errors: resort
    end
  end

  def update
    resort = ResortResource.find(params)

    if resort.update_attributes
      render jsonapi: resort
    else
      render jsonapi_errors: resort
    end
  end

  def destroy
    resort = ResortResource.find(params)

    if resort.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: resort
    end
  end
end
