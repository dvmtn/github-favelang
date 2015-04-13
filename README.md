Github FaveLang
===============

A quick way of seeing what a users favourite language is on Github.

Command Line Usage
------------------

```sh
bin/favelang AdamWhittingham
  # => 'Ruby'
```


Development
-----------
The github API has a 60 requests per minute limit and you'll soon burn through that whilst developing.
You can enable application OAuth to get more requests by adding your OAuth client ID & Secret and exporting them, as follows:
```sh
export GITHUB_CLIENT_ID=<Github app ID>
export GITHUB_CLIENT_SECRET=<Github secret token>
```
You can generate a new token by selecting 'Register new app' from your [github application settings page](https://github.com/settings/applications)
