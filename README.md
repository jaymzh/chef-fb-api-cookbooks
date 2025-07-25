Phil's FB API Style Cookbooks Suite
========================

[![Continuous Integration](https://github.com/jaymzh/chef-fb-api-cookbooks/actions/workflows/ci.yml/badge.svg)](https://github.com/jaymzh/chef-fb-api-cookbooks/actions/workflows/ci.yml)
[![Kitchen Tests](https://github.com/jaymzh/chef-fb-api-cookbooks/actions/workflows/kitchen.yml/badge.svg)](https://github.com/jaymzh/chef-fb-api-cookbooks/actions/workflows/kitchen.yml)

This repo contains attribute-driven-API cookbooks that follow the [Meta/FB
API](https://github.com/facebook/chef-cookbooks) model, but are not maintained
by Meta.

Required reading:
* [Meta's Chef Philosophy](https://github.com/facebook/chef-utils/blob/main/Philosophy.md)
* [Meta's Chef Cookbook Suite README](https://github.com/facebook/chef-cookbooks/blob/main/README.md)

Testing
-------
As it stands testing for this uses only the most minimal set of core cookbooks,
but it's possible the better route is to pull in as much of `fb_init_sample`
as possible. It's unclear.

License
-------
See the LICENSE file in this directory.
