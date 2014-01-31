#!/bin/env ruby
# encoding: utf-8

def user_signs_in_as_recruiter
  text_field(name: 'j_username').set 'recruiter'
  text_field(name: 'j_password').set '123123'
  button(name: 'submit').click
end

def user_signs_in_as_employer
  text_field(name: 'j_username').set 'employer'
  text_field(name: 'j_password').set '123123'
  button(name: 'submit').click
end

def user_logs_out
  a(id: 'menu').should be_present
  a(id: 'menu').click
  b = button(name: 'submit')
  b.should be_present
  b.click
end

def user_selects_menu_item(item)
  a(id: 'menu').should be_present
  a(id: 'menu').click
  a(text: item)
end