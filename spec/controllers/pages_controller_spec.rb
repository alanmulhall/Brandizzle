require 'spec_helper'

describe PagesController do

  describe "handling SHOW" do
    def do_get(id=nil)
      get :show, :id => id || 'about'
    end
    
    it "should render 404 for unknown template" do
      do_get("all_your_pages_belong_to_us")
      response.should_not be_success
    end
    
    %w(about).each do |page|
      it "should render the template for #{page} page" do
        do_get(page)
        response.should be_success
        response.should render_template('pages/show/about')
      end
    end
    
  end

end
