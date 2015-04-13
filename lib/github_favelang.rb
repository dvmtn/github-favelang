require 'octokit'

class GithubFaveLang

  def favoute_language username
    repo_urls = repos_for_user username
  end

  def repos_for_user username
    user = Octokit.user(username)
    user_repos = user.rels[:repos].get
    user_repos.data.map{|repo| repo[:html_url]}
  end

end
