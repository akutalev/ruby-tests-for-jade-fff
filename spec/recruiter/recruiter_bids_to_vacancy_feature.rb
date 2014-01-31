#!/bin/env ruby
# encoding: utf-8
require_relative '../../spec/spec_helper'
require_relative '../../spec/commons/user_auth'

describe 'Recruiter bids to vacancy' do
  before {
    goto 'http://user:abra@recruiters.7bits.it/'
  }

  context "when user bids to active vacancy" do
    it "then employer should receive bid in his 'active bids' page."  do
      user_signs_in_as_recruiter()
      user_selects_menu_item('Profile').click
    end
  end
end


