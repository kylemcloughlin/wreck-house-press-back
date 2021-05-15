require "http"
class DeployWorker
  include Sidekiq::Worker

  def perform
    HTTP.post("https://api.vercel.com/v1/integrations/deploy/prj_IyLVq5fc7aXdQctLkHAuKqOpepkw/FTeVTgMhXC")
  end
end
