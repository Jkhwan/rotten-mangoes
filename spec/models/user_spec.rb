require 'spec_helper'

describe User do
  describe "fullname" do
    it "should return the user's fullname" do
      u = User.new(firstname: "K", lastname: "V")
      expect(u.full_name).to eq("K V")
    end
    it "should return the user's firstname if lastname is not specified" do
      u = User.new(firstname: "K")
      expect(u.full_name).to eq("K")
    end
    it "should return the user's lastname if firstname is not specified" do
      u = User.new(lastname: "V")
      expect(u.full_name).to eq("V")
    end
    it "should return empty string if both firstname and lastname are empty" do
      u = User.new()
      expect(u.full_name).to eq("")
    end
  end

  describe "registration" do
    it "should fail if firstname is not provided" do
      u = User.new(lastname: "V", 
                   email: "kv@gmail.com", 
                   password: "lighthouse", 
                   password_confirmation: "lighthouse")
      expect(u.save).to eq(false)
      expect(u.errors.count).to eq(1)
      expect(u.errors[:firstname].first).to eq("can't be blank")
    end
    it "should fail if lastname is not provided" do
      u = User.new(firstname: "K", 
                   email: "kv@gmail.com", 
                   password: "lighthouse", 
                   password_confirmation: "lighthouse")
      expect(u.save).to eq(false)
      expect(u.errors.count).to eq(1)
      expect(u.errors[:lastname].first).to eq("can't be blank")
    end
    it "should fail if email is not provided" do
      u = User.new(firstname: "K", 
                   lastname: "V", 
                   password: "lighthouse", 
                   password_confirmation: "lighthouse")
      expect(u.save).to eq(false)
      expect(u.errors[:email].first).to eq("can't be blank")
    end
    describe "password" do
      it "should fail if password is not provided" do
        u = User.new(firstname: "K", 
                     lastname: "V", 
                     email: "kv@gmail.com")
        expect(u.save).to eq(false)
        expect(u.errors[:password].first).to eq("can't be blank")
      end
      it "should fail if password is shorter than 6 digit" do
        u = User.new(firstname: "K", 
                     lastname: "V", 
                     email: "kv@gmail.com",
                     password: "12345",
                     password_confirmation: "12345")
        expect(u.save).to eq(false)
        expect(u.errors[:password].first).to eq("is too short (minimum is 6 characters)")
      end
      it "should fail if password is longer than 20 digit" do
        u = User.new(firstname: "K", 
                     lastname: "V", 
                     email: "kv@gmail.com",
                     password: "123456789012345678901",
                     password_confirmation: "123456789012345678901")
        expect(u.save).to eq(false)
        expect(u.errors[:password].first).to eq("is too long (maximum is 20 characters)")
      end
      it "should fail if password confirmation is not provided" do
        u = User.new(firstname: "K", 
                     lastname: "V", 
                     email: "kv@gmail.com",
                     password: "123456")
        expect(u.save).to eq(false)
        expect(u.errors[:password_confirmation].first).to eq("can't be blank")
      end    
      it "should fail if password and password confirmation does not match" do
        u = User.new(firstname: "K", 
                     lastname: "V", 
                     email: "kv@gmail.com",
                     password: "123456",
                     password_confirmation: "654321")
        expect(u.save).to eq(false)
        expect(u.errors[:password_confirmation].first).to eq("doesn't match Password")
        expect(u.errors.count).to eq(1)
      end     
      it "should create new user if all fields are provided" do
        u = User.new(firstname: "K", 
                     lastname: "V", 
                     email: "kv@gmail.com",
                     password: "123456",
                     password_confirmation: "123456")
        expect(u.save).to eq(true)
      end     
      it "should fail if email provided is not a valid email" do
        u = User.new(firstname: "K", 
                     lastname: "V", 
                     email: "kv",
                     password: "123456",
                     password_confirmation: "123456")
        expect(u.save).to eq(false)
        expect(u.errors[:email].first).to eq("is invalid")
      end
    end
  end
end
