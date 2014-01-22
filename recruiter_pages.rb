#!/bin/env ruby
# encoding: utf-8
require_relative 'spec/spec_helper'

describe 'Recruiter System' do
  before {
    goto 'http://user:abra@recruiters.7bits.it/'
  }

  shared_examples_for 'login page' do
    it do
      text_field(name: 'j_username').should be_present
      text_field(name: 'j_password').should be_present
      button(name: 'submit')
    end
  end

  context 'when login page' do
    it_behaves_like 'login page'
  end

  context 'when recruiter logging in' do
    it do
      text_field(name: 'j_username').set 'recruiter'
      text_field(name: 'j_password').set '123123'
      button(name: 'submit').click
      ul(class: 'nav navbar-nav navbar-right').should be_present
    end
  end

  context 'when user logged out' do
    it 'signs him off and redirect to login pages' do
      a(id: 'menu').should be_present
      a(id: 'menu').click
      b = button(name: 'submit')
      b.should be_present
      b.click
    end
    it_behaves_like 'login page'
  end
end