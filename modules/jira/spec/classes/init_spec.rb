require 'spec_helper'
describe 'jira' do

  context 'with defaults for all parameters' do
    it { should contain_class('jira') }
  end
end
