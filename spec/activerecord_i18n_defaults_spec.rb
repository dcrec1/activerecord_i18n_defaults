require File.dirname(__FILE__) + '/spec_helper.rb'

class Admin < ActiveRecord::Base
end

class User < ActiveRecord::Base
end

describe "Human attribute name" do

  before :all do
    I18n.load_path << File.dirname(__FILE__) + "/locale.yml"
    I18n.default_locale = 'aa-BB'
  end

  it "should lookup human attribute in '_all' attribute when specified is not found" do
    User.human_attribute_name('login').should eql(I18n.t('activerecord.attributes._all.login'))
  end
  
  it "should get human attribute when found" do
    Admin.human_attribute_name('login').should eql(I18n.t('activerecord.attributes.admin.login'))
  end

end
