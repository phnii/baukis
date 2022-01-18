require 'rails_helper'

RSpec.describe Administrator, type: :model do
  describe "#password=" do
    example "文字列を与えるとhased_passwordの長さは60の文字列になる" do
      administrator = Administrator.new
      administrator.password = "testpass"
      expect(administrator.hashed_password).to be_kind_of(String)
      expect(administrator.hashed_password.size).to eq 60
    end
    example "nilを与えるとhashed_passwordはnilになる" do
      administrator = Administrator.new
      administrator.password = nil
      expect(administrator.hashed_password).to be_nil
    end
  end
end
