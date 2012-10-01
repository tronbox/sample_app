require 'spec_helper'

describe ConsultasController do

  describe "GET 'general'" do
    it "returns http success" do
      get 'general'
      response.should be_success
    end
  end

end
