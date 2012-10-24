#
# Cookbook Name:: hellobits-ruby
# Recipe:: default
#
# Copyright (C) 2012 Felipe G. Coury
# 
# All rights reserved - Do Not Redistribute
#

case node[:ruby][:install_method]
when 'source'
when 'package'
  case node[:platform]
  when 'ubuntu', 'debian'
    apt_repository "hellobits" do
      uri "http://apt.hellobits.com/"
      repo_name "hellobits"
      distribution "precise"
      components ["main"]
      key "http://apt.hellobits.com/hellobits.key"
      action :add
    end
  end
  package 'ruby-stable'
end

script "update rubygems" do
  interpreter "bash"
  user "root"
  code "gem update --system"
end
