require 'rails_helper'

RSpec.describe Venue, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:provider_updates) }

    it { should have_many(:photos) }

    it { should have_many(:users) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
