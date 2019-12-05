require 'rails_helper'

RSpec.describe User, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:sent_messages) }

    it { should have_many(:direct_messages) }

    it { should have_many(:parent_comments) }

    it { should have_many(:comments) }

    it { should have_many(:photos) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
