require File.dirname(__FILE__) + '/spec_helper.rb'

describe I18n do

  before :all do
    I18n.load_path << File.dirname(__FILE__) + "/locale.yml"
    I18n.default_locale = 'aa-BB'
  end

  it "should lookup the translation key in global attributes when specified is not found" do
    I18n.t('activerecord.attributes.user.login').should eql(I18n.t('activerecord.global-attributes.login'))
  end
  
  it "should translate normally when key is found" do
    I18n.t('activerecord.attributes.admin.login').should eql("custom login")
  end
  
  it "should not lost default translation" do
    default_value = 'ew igfwej giowewe'
    I18n.t('im.do.not.exist', :default => default_value).should eql(default_value)
  end
  
  it "should not lost the feature of working with symbols" do
    I18n.t(:hey).should eql("jo")
  end

end
