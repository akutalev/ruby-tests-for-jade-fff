#!/bin/env ruby
# encoding: utf-8
require_relative '../spec/spec_helper'
require_relative '../spec/commons/user_auth'

describe 'Login Page' do
  before {
    goto 'http://user:abra@recruiters.7bits.it/'
  }

  def check_login_page
    text_field(name: 'j_username').should be_present
    text_field(name: 'j_password').should be_present
    button(name: 'submit').should be_present
  end

  context "when user goes to login page" do
    it "then he will see three main elements (login input, pass input and submit button)"  do
      text_field(name: 'j_username').set 'aaa'
      text_field(name: 'j_password').set 'bbb'
      button(name: 'submit').click
      check_login_page()
    end
  end

  context "when user sets wrong login and pass" do
    it "then he will stay to the login page"  do
      text_field(name: 'j_username').set 'aaa'
      text_field(name: 'j_password').set 'bbb'
      button(name: 'submit').click
      check_login_page()
    end
  end

  context "when user logs in as recruiter" do
    it "then he will be redirected to the 'active deals' page for recruiters"  do
      user_signs_in_as_recruiter()
      ul(class: 'nav navbar-nav navbar-right').should be_present
    end
  end

  context 'when user logged out' do
    it 'then signs him off and redirect to login page' do
      user_logs_out()
      check_login_page()
    end
  end

  context "when user logs in as employer" do
    it "then he will be redirected to the 'active deals' page for employers"  do
      user_signs_in_as_employer()
      ul(class: 'nav navbar-nav navbar-right').should be_present
    end
  end

  context 'when user logged out' do
    it 'then signs him off and redirect to login page' do
      user_logs_out()
      check_login_page()
    end
  end
end


