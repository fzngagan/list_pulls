require 'octokit'
client = Octokit::Client.new(access_token:  "*your access token*")

repository = "paviliondev/discourse-custom-wizard"
branch = "master"
client.auto_paginate = true
pulls = client.pulls(repository, state: 'closed', base: 'master').reject{|pull| !pull[:merged_at] }.sort_by(&:merged_at).reverse

puts pulls.map {|pull_req| {title: pull_req[:title], number: pull_req[:number]}}
# merged_at
