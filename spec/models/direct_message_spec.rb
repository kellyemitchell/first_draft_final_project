require 'rails_helper'

RSpec.describe DirectMessage, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:sender) }

    it { should belong_to(:parent) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
