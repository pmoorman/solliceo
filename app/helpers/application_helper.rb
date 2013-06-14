module ApplicationHelper
  def viewer_short_url(viewer)
    viewer_short_override_url(viewer, subdomain: viewer.user.subdomain)
  end
end
