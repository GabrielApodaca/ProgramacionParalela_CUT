module Routes
  class Site < Grape::API
    namespace :sites do

      get :all do
        Sites.all
      end

      post :create do
        Sites.create
      end

      route_param :event_id do
        get :find do
          Sites.find_id(param['event_id'])
        end

        delete do
          Sites.delete_id()
        end
      end

    end
  end
end
